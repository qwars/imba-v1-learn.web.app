
# Классы

## Объявление

```imba
class Point
    def initialize x,y
        @x = x
        @y = y
```

## Экземпляры

Для создания экземпляров классов в Imba вы используете метод new, например Array.new, в отличие от специального синтаксиса new Array() в JavaScript. Это не специфично для классов, созданных в Imba, но используется для создания любых объектов, будь то встроенные конструкторы в JavaScript, такие как Array, Object, RegExp, а также классы/конструкторы других языков программирования.

## Свойства

Вы можете определять свойства в классах, которые автоматически генерируют геттеры и сеттеры. Как уже упоминалось ранее, в Imba придерживаются философии, что классы должны предоставлять доступ к своим данным только через методы. Если в JavaScript вы хотите получить/установить заголовок (title) элемента списка задач (Todo), то обычно вы просто получаете/устанавливаете его как свойство напрямую. В Imba вместо этого вы бы предпочли определить *методы* для установки и получения заголовка.


```imba
class Todo

    prop title

```

Вышеуказанное в основном является быстрым способом определения и геттера, и сеттера для экземплярной переменной title.

```imba
class Todo

    def title
        @title

    def title= value
        @title = value

```

> **TODO** Explain advanced features of `prop` and `attr`.

## Наследование

Классы могут наследовать друг от друга. Реализация основана на прототипном наследовании JavaScript с некоторыми дополнительными удобствами.

```imba
# Example borrowed from coffeescript.org
class Animal

    def initialize name
        @name = name

    def move meters
        console.log "{@name} moved {meters}m."

class Snake < Animal
    def move
        console.log "Slithering..."
        super 5

class Horse < Animal
    def move
        console.log "Galloping..."
        super 45

var sam = Snake.new "Sammy the Python"
var tom = Horse.new "Tommy the Palomino"

sam.move
tom.move
```

> **TODO** Explain advanced use of super
