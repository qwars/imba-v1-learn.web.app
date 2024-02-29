---
title: Введение
order: 1
---

# Введение

## Что такое Imba?

Imba - это новый язык программирования для веба, который компилируется в производительный JavaScript. Он сильно вдохновлен Ruby и Python, но разработан явно для веб-программирования (как на сервере, так и на клиенте). Imba относится к элементам DOM как к полноценным объектам. Эти элементы компилируются в [встроенный DOM](/guides/advanced/performance), который [в разы быстрее](https://somebee.github.io/dom-reconciler-bench/index.html) современных виртуальных DOM-реализаций. Мы искренне верим, что это открывает новый путь в разработке веб-приложений.

## Установка

```
yarn global add imba # npm install -g imba
```

# Оптимизирован для

## Developers

Вместо того, чтобы быть академическим упражнением, Imba был разработан на протяжении нескольких лет вместе с реальными приложениями. Imba был настроен для облегчения сложностей, с которыми мы сталкиваемся при разработке больших и динамичных приложений (и сайтов).

## Interoperability
Imba компилируется в чистый и читаемый JavaScript. Ваше форматирование, отступы и комментарии сохраняются. Вы можете без проблем использовать любую существующую JavaScript-библиотеку из Imba и наоборот.

## Speed
Вы можете использовать все синтаксические улучшения в Imba, не беспокоясь о производительности и читаемости скомпилированного кода, и создание представлений с использованием встроенной поддержки Imba для тегов приводит к беспрецедентной производительности.

```imba
var number = 42
var opposite = true
var string = "the answer is {number}"
var regex = /answer is (\d+)/

var info =
    name: 'Imba'
    version: Imba.VERSION
    repository: 'https://github.com/imba/imba'
    inspiration: ['ruby','python','react','coffeescript']
    creator: 'Sindre Aarsaether'
    contributors: [
        'Sindre Aarsaether' # github.com/somebee
        'Magnus Holm' # github.com/judofyr
        'Slee Woo' # github.com/sleewoo
    ]
```

> Хотя Imba использовался в производстве более года (используется на scrimba.com), сообщество находится на ранней стадии развития, и документация все еще отсутствует. Мы особенно благодарны за любую обратную связь, предложения и помощь в разработке документации!


## Синтаксис и семантика

Хотя синтаксис и семантика Imba больше связаны с Ruby, чем с JavaScript, он компилируется в обычный и производительный JavaScript и полностью совместим с любой существующей JavaScript-библиотекой. Imba не расширяет ни один из встроенных типов JavaScript. Массивы остаются массивами, строки - строками, числа - числами, классы - конструкторами с прототипами и так далее. Если вам нравится Imba больше, нет никаких причин, чтобы не писать свой npm-пакет на Imba, даже если он предназначен для использования в общей JavaScript-экосистеме. На самом деле, Imba генерирует *очень* читаемый JavaScript, сохраняя отступы, комментарии и стиль кодирования.

```imba
# Strings
var single = 'single quotes'
var double = "double quotes"
var interpolation = "string has {double}"

# Numbers
var integer = 42
var float = 42.10

# Objects
var object = {name: 'Imba', type: 'Language'}

# Arrays
var array = [1,2,3,4,5]

# Regular expressions
var regex = /number is (\d+)/

# Functions
def hello
    console.log 'got here'
    return 'world'

# Classes
class Todo
    # automatic getter/setter declaration
    prop title

    def initialize title
        # instance variables
        @title = title
        @completed = no

    def complete
        @completed = yes

# Tags
var item = <div.header> "This is a div"
var list = <ul.list> for item in ["one","two","three"]
    <li> <span.name> item
```


## Для начала

> Это руководство предполагает знание HTML, CSS и JavaScript (или другого языка программирования). Оно будет особенно полезно, если вы знакомы с React для лучшего понимания работы с тегами и пользовательскими тегами.

Тут распишу как добавить плагин в [VSCode](https://github.com/somebee/vscode-imba)



