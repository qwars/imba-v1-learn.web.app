---
title: Basics
order: 1
---

# Основное

Несмотря на то, что синтаксис и семантика Imba более связаны с Ruby, чем с JavaScript, он компилируется в обычный и производительный JavaScript и полностью совместим с любой существующей JavaScript-библиотекой. Imba не расширяет ни один из встроенных типов JavaScript. Массивы - это массивы, строки - строки, числа - числа, классы - конструкторы с прототипами и так далее. Если вам просто нравится Imba больше, нет никакой причины не писать свой пакет npm на Imba, даже если он предназначен для использования в общей экосистеме JavaScript. Фактически, Imba генерирует *очень* читаемый JavaScript, сохраняя форматирование, комментарии и стиль кодирования.

### Interoperability

Imba компилируется в очень простой JavaScript. Все основные типы такие же, как в JavaScript, поэтому для получения документации о доступных методах вы можете обратиться к MDN [Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object), [Function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function), [String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String), [Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number), [RegExp](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp), [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), [Date](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date), [Math](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math).

#### Strings

```imba
var single = 'single quotes'
var double = "double quotes"
var interpolation = "string has {double}"
```

#### Numbers

```imba
var integer = 42
var float = 42.10
```

#### Objects

```imba
var object = {name: 'Imba', type: 'Language'}
```


#### Arrays

```imba
var array = [1,2,3,4,5]
```

#### Regexes

```imba
var regex = /number is (\d+)/
```

#### Loops
```imba
for num in [1,2,3]
    num

for own key, value of object
    value
```

#### Functions

```imba
def hello
    return 'world'

console.log hello
```

#### Classes

```imba
class Todo

    def initialize title
        @title = title
        @completed = no

    def complete
        @completed = yes
```

#### Operators

```imba
var item
item = 100 # set value of item
item ||= 100 # set if value is falsy
item &&= 100 # set if value is already truthy
item ?= 100 # set if value is null or undefined

# comparators
item == 10 # check
item === 10 # strictly equal
item != 10 # not equal
item !== item # strictly not equal
item > 10 # greater than
item < 10 # less than
item >= 10 # greater than or equal
item <= 10 # less than or equal
```

#### Bitwise operators

```imba
a & b   # Bitwise AND
a | b   # Bitwise OR
a ^ b   # Bitwise XOR
~ a     # Bitwise NOT
a << b  # Left shift
a >> b  # Sign-propagating right shift
a >>> b	# Zero-fill right shift
```
