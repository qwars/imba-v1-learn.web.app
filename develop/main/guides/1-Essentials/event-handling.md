# Обработка событий

## Прослушание событий

Мы можем использовать `<tag :имя-события=обработчик>` ( `<tag :eventname=handler>` ), чтобы прослушивать события DOM и выполнять код при их возникновении.

```imba
tag App
    prop counter
    def render
        <self.bar>
            # будет вызываться при клике на кнопку.
            <button :click=(do counter++)> "Increment"
            <div> "count is {counter}"

Imba.mount <App counter=0>
```
В приведенном выше примере мы определили обработчик встроенным образом. Обычно лучше определять обработчики событий вне представления и отделить их от самих событий. Это можно сделать несколькими способами.

## Разрешение обработчиков 


Вы также можете указать строку в качестве обработчика (`<div :click="doSomething">`). В этом случае Imba будет искать метод с таким именем в текущем контексте (self). Это означает, что если вы определили методы в своих пользовательских тегах, вы можете ссылаться на эти методы. Так как привязка событий является неотъемлемой частью разработки веб-приложений, Imba также имеет специальный синтаксис для этого.

```imba
tag App
    prop counter

    def increment
        counter++

    def step amount
        counter += amount

    def render
        <self.bar>
            # Встроенный обработчик
            <button :click=(do counter++)> "+1"
            # Ссылка на метод объекта `self`
            <button :click='increment'> "+1"
            # Ссылка с аргументами
            <button :click=['step',2]> "+2"
            # Сокращенная ссылка
            <button :click.increment> "+1"
            # Сокращенная ссылка с аргументами
            <button :click.step(3)> "+3"

            <div> "count is {counter}"

Imba.mount <App counter=0>
```

> `tap` - это псевдоним для `click`, который работает на мобильных устройствах, планшетах и настольных компьютерах.

## Модификаторы событий

Вдохновленный Vue.js, Imba также поддерживает модификаторы. В большинстве случаев обработчики событий - простые функции, которые выполняют некоторые действия с входящим событием (stopPropagation, preventDefault и т.д.) и затем продолжают выполнение фактической логики. Используя модификаторы прямо там, где мы привязываемся к событию, наши обработчики не нуждаются в информации о событии в первую очередь.

```
# Вызовите preventDefault на событии submit, а затем вызовите doSomething.
<form :submit.prevent.doSomething>
```

> В этом случае разница между модификатором и обработчиком фактически отсутствует. На самом деле, модификаторы реализованы в виде методов на элементе, и вы также можете определять пользовательские модификаторы.

* `.stop` - предотвращает всплытие события
* `.prevent` - вызывает preventDefault на событии
* `.silence` - явно указывает Imba не передавать событие планировщикам ( schedulers )
* `.self` - вызывать последующие обработчики только в том случае, если event.target - это сам элемент

### Модификаторы клавиш

Для событий клавиатуры (keydown, keyup, keypress) также доступны некоторые очень полезные модификаторы.

```
# Вызовите addItem, когда нажата клавиша Enter.
<input type='text' :keydown.enter.addItem>

# Допускается использовать несколько обработчиков для одного события.
# Вызывайте обработчики gotoPrev и gotoNext, когда нажаты клавиши вверх/вниз.
<div :keydown.up.gotoPrev :keydown.down.gotoNext>
```
 
* .left
* .right
* .up
* .down
* .enter
* .tab
* .esc
* .space
* .del

### Системные модификаторные клавиши

* .ctrl
* .alt
* .shift
* .meta


```
# Вызывайте обработчик только при нажатии клавиши Ctrl.
<button :click.ctrl.myHandler>

# only trigger when ctrl is pressed Shift
<button :click.shift.myHandler>

# Порядок модификаторов имеет значение;
# Всегда предотвращайте действие по умолчанию, но вызывайте обработчик myHandler только в случае, если нажата клавиша Alt.
<button :click.prevent.alt.myHandler>
```

### Модификаторы кнопок мыши

* .left
* .right
* .middle

## Объявление обработчиков по умолчанию

Когда событие обрабатывается в Imba, он также ищет метод `on(eventname)` на тегах по мере прохождения вверх от исходного элемента.

```
tag App
    def onsubmit e
        e.prevent
        window.alert('Tried to submit!')

    def render
        <self>
            <form>
                <input type='text'>
                <button type='submit'> "Submit"

Imba.mount <App>
```


## Пользовательские события

#### `tag.trigger(name, data = null)`

Пользовательские события будут всплывать, подобно встроенным событиям, однако они будут отправляться и обрабатываться непосредственно внутри системы событий Imba.Event, без генерации реального события браузера. По желанию, вы можете передать данные для события вторым аргументом. Вот довольно сложный пример, иллюстрирующий несколько способов работы с пользовательскими событиями.


```imba
tag Todo < li
    def clickRename
        trigger('itemrename',data)

    def clickTitle
        trigger('itemtoggle',data)

    def render
        <self .done=data:done> 
            <span :tap.clickTitle> data:title
            <button :tap.clickRename> 'rename'

tag Todos < ul
    def setup
        @items = [
            {title: "Remember milk", done: false}
            {title: "Test custom events", done: false}
        ]

    # Внутренний элемент "todo" запускает пользовательское событие "itemtoggle" при касании, 
	# которое будет всплывать вверх и, в конечном итоге, вызовет событие "onitemtoggle".
    def onitemtoggle e
        e.data:done = !e.data:done

    def onitemrename e
        var todo = e.data
        todo:title = window.prompt("New title",todo:title)

    def render
        <self> for item in @items
            <Todo[item]>

Imba.mount <Todos>
```

## Интерфейс событий

Imba обрабатывает все события в дереве DOM через единственный менеджер, прослушивающий события на корневом элементе вашего документа. Каждое встроенное событие оборачивается в экземпляр Imba.Event, который имеет несколько полезных методов, о которых стоит знать:

```imba
tag CustomElement
    def onclick event
        event.target # Возвращает целевой элемент Imba.Tag для события.
        event.native # Возвращает встроенное DOM-событие (native DOMEvent).
        event.type # Возвращает тип события, в данном случае - 'click'.
        event.prevent # Вызывает метод preventDefault() на встроенном событии (native event).
        event.stop # Вызывает метод stopPropagation() на встроенном событии (native event).

        # Несколько методов для доступа к встроенному событию (native event):
        event.x # Event:x
        event.y # event.native:y
        event.button # event.native:button
        event.which # event.native:which
        event.alt # event.native:altKey
        event.shift # shiftKey
        event.ctrl # event.native:ctrlKey
        event.meta # event.native:metaKey
```
