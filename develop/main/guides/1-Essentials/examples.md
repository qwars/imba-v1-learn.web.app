# Примеры

## Фильтрация списка

```imba
# Получить имена всех свойств элемента
var items = Object.keys(Element:prototype).sort

tag App
    prop query default: ""

    def render
        <self>
            # Связываем поле ввода со свойством запроса.
            <input[query] type='text'>
            # Отображение списка с некоторыми встроенными стилями css
            <ul css:height=200 css:overflow='auto'>
                # filter list while iterating
                for item in data when item.indexOf(query) >= 0
                    <li> item

Imba.mount <App[items]>
```


## Мастер-детали

```imba
# Получить имена всех свойств элемента ( Element ).
var notes = [
    {body: "First note"}
]

tag App
    prop note

    def addItem
        notes.unshift(body: "New Note")

    def render
        <self.hbox css:height=200>
            <aside>
                <ul> for item in notes
                    <li .selected=(note == item) :tap.setNote(item)>
                        <span> item:body
                <footer> <button :tap.addItem> "New note"
            if note
                <section> <textarea[note:body].full>

Imba.mount <App>
```


## Простой список задач (todo list)

```imba
tag App
    prop items

    def addItem
        if @input.value
            items.push(title: @input.value)
            @input.value = ""

    def toggleItem item
        item:completed = !item:completed

Imba.mount <App.vbox items=[] ->
    <form.bar :submit.prevent.addItem>
        <input@input>
        <button> 'add'
    <ul> for item in items
        <li .done=item:completed :tap.toggleItem(item)> item:title
```

## More examples

### [Imba.io](https://github.com/somebee/imba.io)

Вся веб-сайт написан на Imba. Он использует один и тот же код как для сервера, так и для клиента. После первоначальной загрузки, навигация в браузере происходит с использованием истории (push/popState) и отрисовывается непосредственно на клиенте. Однако, при жестком обновлении страницы, веб-сайт будет отображаться с сервера, что позволяет оказаться на той же странице. Это достигается благодаря использованию одинаковой логики для маршрутизации. Вы можете найти код на [GitHub](https://github.com/somebee/imba.io).

### [TodoMVC](https://github.com/somebee/todomvc-imba)

The basic Imba implementation of TodoMVC is a good place to start playing around.

### [Hello World](https://github.com/imba/hello-world-imba)

Tiny application with webpack/imbapack setup.
