
# Теги

Несмотря на то, что теги являются простыми обертками вокруг нативных элементов DOM, они имеют некоторую функциональность, которую стоит знать. Если вы хотите работать с элементом DOM напрямую, вы всегда можете получить доступ к нему через tag.dom. Элемент DOM также содержит ссылку на свою обертку Imba.Tag через domElement:_tag.

```
var element = <div.one.two> "Hello"
element # => Imba.Tag - thin wrapper
element.dom # => HTMLDivElement - real dom element
```

> imba.io полностью написан на Imba, и представления генерируются с использованием тегов. Тот же код рендерится как на сервере, так и на клиенте, используя одну и ту же логику для маршрутизации и т.д. Если вас интересует, исходный код доступен публично на [GitHub](https://github.com/somebee/imba.io).

## Экземпляры

Вы можете рассматривать синтаксис тегов как очень краткий специализированный синтаксис для создания экземпляров определенного типа объектов. Точно так же, как [] является более коротким способом создания массива new Array().

```imba
var array = [] # shorthand for creating an array
var node = <div> # shorthand for creating a div element

<div.one title='hello'>
# is really just shorthand for
Imba.createElement('div').flag('one').setTitle('hello').end()
```


## Цикл жизни (Lifecycle)

Есть несколько методов, которые вы можете переопределить в пользовательских тегах, чтобы подключиться к циклу жизни тега. Здесь мы переопределим все эти методы в нашем пользовательском теге Example:

```imba
tag Example
    def build
        # Вызывается один раз до установки свойств
        # Установка переменной экземпляра "counter"
        @counter = 0

    def setup
        # Вызывается один раз после установки свойств

    def mount
        # Вызывается, когда тег был добавлен в документ
        # Запланировать вызов метода "tick" тега каждые 1000 мс (1 секунда)
        schedule(interval: 1000)

    def unmount
        # Вызывается, когда тег был удален из документа
        # Снятие планирования для выполнения метода schedule в tag
        unschedule

    def tick
        # Вызывается, если тег запланирован и планировщик активен
        # По умолчанию выполняется вызов render
        render

    def render
        # внутреннее представление
        <self.bar>
            <strong> "Title: {data:name}"
            <em> "Counting {@counter++}"

# Установить экземпляр тега Example с некоторыми данными
Imba.mount <Example[{name: "Lifecycle"}]>
```

## Интерфейс

```imba
tag Example
    def interface
        dom # Доступ к нативному элементу DOM
```

## Планирование ( Scheduling )

Когда вы монтируете тег с помощью Imba.mount, обычно вам не нужно задумываться о планировании.

#### Default scheduling

```imba
var counter = 0
var status = "Hello"

tag App
    def doSomething
        self

    def loadAsync
        status = "loading"
        Promise.new do |resolve|
            setTimeout(&,500) do
                resolve(status = "loaded")

    def render
        <self.bar>
            <button> "noop"
            <button :tap.doSomething> "handle" 
            <button :tap.loadAsync> "async"
            <div> "Rendered: {++counter}"
            <div> "Status: {status}"

# when mounting a node with Imba.mount it will automatically
# be scheduled to render after dom events and Imba.commit
Imba.mount <App>
```

Хотя большинство изменений состояния вашего приложения происходит в результате взаимодействия пользователя, все же есть несколько мест, где вам нужно уведомить Imba, что что-то изменилось. Например, если вы получаете данные из сокета, вы можете вызвать Imba.commit после получения сообщений socket.addEventListener('message', Imba.commit), и если вы получаете данные с сервера вне обработчиков событий, вы можете вызвать Imba.commit в конце операции получения данных.

#### Рендеринг каждого кадра

```imba
tag App
    def mount
        schedule(raf: true)

    def onmousemove e
        @x = e.x
        @y = e.y

    def render
        <self.bar>
            <div> "Mouse is at {@x or 0} {@y or 0}"

Imba.mount <App>
```

#### Рендеринг с интервалами

```imba
tag Clock
    def mount
        schedule(interval: 1000)

    def render
        <self> Date.new.toLocaleString

Imba.mount <Clock>
```
