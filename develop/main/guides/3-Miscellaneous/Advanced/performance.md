
# Performance

Виртуальный DOM был фантастическим инновационным решением. Благодаря процессу обновления/заплатки DOM для отражения изменений состояния, стало возможным писать представления (виды) в декларативном стиле. Благодаря этому процесс обновления DOM значительно ускорился.

К сожалению, виртуальные DOM-ы все еще медленны. Imba выбрала совершенно другой подход, который оказался *гораздо* быстрее.

> [Screencast about Imba performance](https://scrimba.com/p/c6B9rAM)

### The Memoized DOM

```imba
var tip = "Item"
var div = <div.large title=tip> "Hello"
```

Хотя теги в Imba выглядят декларативно, они компилируются в ряд операций, создающих и изменяющих состояние тега.

```javascript
var tip = "Item";
var div = createElement('div').flag('large').setTitle(tip).setText("Hello");
```

Что, если мы разделим создание div и остальные операции?

```javascript
var tip = "Item";
var div = createElement('div');
var render = function(){
    div.flag('large').setTitle(tip).setText("Hello");
}
```

Теперь, атрибуты будут применяться к div каждый раз, когда мы вызываем render. Если мы изменяем значение tip и вызываем render снова, то div будет иметь новый атрибут title. Это лишь небольшая иллюстрация того, что делает компилятор Imba под капотом.

```imba
tag Component
    def render
        <self>
            <h1.title> "Welcome"
            <p.desc> "I am a component"
```

Пользовательский компонент, приведенный выше, компилируется в следующий JavaScript-код:

```javascript
var Component = Imba.defineTag('Component', function(tag){
    tag.prototype.render = function (){
        var $ = this.$;
        return this.setChildren($.$ = $.$ || [
            createElement('h1',$,0,this).flag('title').setText("Welcome"),
            createElement('p',$,1,this).flag('desc').setText("I am a component")
        ]).synced();
    };
});
```

Если вы тщательно посмотрите сюда, то заметите, что при первом вызове render создаются два дочерних элемента и устанавливаются их атрибуты. При следующем вызове render массив дочерних элементов уже будет закэширован, поэтому ничего не произойдет. Это нормально, поскольку здесь нет динамического содержимого или атрибутов.

Что произойдет, если мы добавим динамический атрибут?

```imba
tag Component
    def render
        <self>
            <h1.title> "Welcome"
            # Include 'red' className 50% of the time, randomly
            <p.desc .red=(Math.random > 0.5)> "Roulette"
```

компилируется в следующий код:

```javascript
var Component = Imba.defineTag('Component', function(tag){
    tag.prototype.render = function (){
        var $ = this.$;
        return this.setChildren($.$ = $.$ || [
            _1('h1',$,0,this).flag('title').setText("Welcome"),
            _1('p',$,1,this).flag('desc').setText("Roulette")
        ],2).synced((
            $[1].flagIf('red',Math.random() > 0.5)
        ,true));
    };
});
```

Теперь элементы будут созданы при первом рендеринге, но динамическая часть была выделена из закэшированных дочерних элементов и выполняется при каждом рендеринге. Это ядро концепции, которую Imba использует для своего молниеносного рендеринга. Хотя она более сложная, та же самая концепция применяется для условий, циклов и всего остального внутри деревьев тегов.

```imba
tag Component
    def render
        <self>
            <h1.title> "Welcome"
            <p.desc .red=(Math.random > 0.5)> "Roulette"
            <ul.list> for item in data
                <TodoItem> item
```

компилируется в следующий код:

```javascript
var Component = Imba.defineTag('Component', function(tag){
    tag.prototype.render = function (){
        var $ = this.$, self = this;
        return self.$open(0).setChildren($.$ = $.$ || [
            _1('h1',$,0,self).flag('title').setText("Welcome"),
            _1('p',$,1,self).flag('desc').setText("Roulette"),
            _1('ul',$,2,self).flag('list')
        ],2).synced((
            $[1].flagIf('red',(Math.random() > 0.5)),
            $[2].setContent((function($0) {
                for (let i = 0, ary = self.data(), len = $0.taglen = ary.length; i < len; i++) {
                    ($0[i] || _1(TodoItem,$0,i)).setContent(ary[i],3).end();
                };return $0;
            })($[3] || _2($,3,$[2])),4)
        ,true));
    };
});
```

При просмотре скомпилированного вывода для более сложных тегов начинает становиться понятным, что такой подход был бы сложным без компилируемого в JavaScript языка. Однако концепция очень проста, и именно она позволяет Imba быть в десятки раз быстрее, чем популярные фреймворки, используемые в настоящее время.
