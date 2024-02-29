---
title: Closer Look at Tags
order: 6
---

# Более детальный взгляд на теги

Хотя теги являются всего лишь тонкими оболочками над нативными элементами DOM, они имеют некоторую функциональность, которую стоит знать. Если вы хотите работать с элементом DOM напрямую, вы всегда можете получить к нему доступ через tag.dom.

```
var element = <div.one.two> "Hello"
element # => Imba.Tag - thin wrapper
element.dom # => HTMLDivElement - real dom element
```


### Lifecycle

Существует несколько методов, которые вы можете переопределить в пользовательских тегах, чтобы подключиться к жизненному циклу тега. Ниже приведен пример, в котором мы переопределяем все эти методы в пользовательском теге Example:

```imba
tag Example
    def build
        # called once, before properties are set
        # setting an instance variable 'counter'
        @counter = 0

    def setup
        # called once, after properties are set

    def mount
        # called when tag has been added to the document
        # schedule tag (to call tick) every 1000ms
        schedule(interval: 1000)

    def unmount
        # called when tag has been removed from the document
        # unscheduling the tag
        unschedule

    def tick
        # called when/if tag is scheduled and scheduler is active
        # default is to call render
        render

    def render
        # declare inner view
        <self>
            <h1> "Title: {data:name}"
            <h3> "Counting {@counter++}"

# Mount an instance of Example - with some data
Imba.mount <Example[{name: "Lifecycle"}]>
```

### Методы

Доступ к непосредственному элементу DOM для данного тега можно получить через свойство dom.

#### `tag.flags`

Вы можете получить доступ к списку классов с помощью выражения tag.dom.classList.

#### `tag.data`

Метод data возвращает данные, привязанные к данному тегу. Вы можете получить доступ к данным с помощью выражения tag.data.

#### `tag.render`

По умолчанию метод не выполняет никаких действий. Вы можете переопределить этот метод для создания собственной логики рендеринга.

#### `tag.trigger(name, data = null)`

Метод trigger позволяет генерировать пользовательские события для данного тега. События будут всплывать, как и обычные события, но обрабатываться непосредственно внутри системы событий Imba.Event, без генерации реального события браузера. В качестве необязательного второго аргумента можно передать данные для события.

```
tag CustomList < ul
    def select item
        trigger('listselect',item)
```

#### `tag.schedule(options)`

Метод activate вызывается для активации планировщика (scheduler) для данного тега. Параметры по умолчанию - events: true. Дополнительные параметры можно увидеть в документации к Imba.Scheduler.

```imba
tag Clock
    def mount
        # when element is inserted in document
        # schedule to re-render every second:
        schedule(interval: 1000)

tag App
    def mount
        # when element is inserted in document
        # schedule to re-render after every handled event
        schedule(events: true)

```

#### `tag.unschedule`

Метод deactivate вызывается для деактивации планировщика (scheduler) для данного тега.

### Flagging

### Styling

#### `tag.css(name)`

Возвращает значение встроенного стиля с указанным именем (name).`

#### `tag.css(name, value)`

Установка стилей

```imba
var node = <div>
# with key and value
node.css('display','block')
# with object
node.css(display: 'block', position: 'absolute')

<div css:display='block'>
# inline styles are actually using the css-method
# Imba.createElement('div').css('display','block').end()
```
