
# Функции

В Imba есть два типа функций: *методы* и *блоки*. Imba автоматически возвращает последнее выражение из функции.

## Методы

```imba
def randomize
    Math.random
```

```imba
# Один аргумент
def square num
    num * num
```

```imba
# Опциональные аргументы
def call url, method = 'GET'
    # do something here
```

```imba
# Переменное количество аргументов
def race winner, *rest
    "{winner} beat {rest.join(', ')}"
```

```imba
# Опциональные аргументы с обратным вызовом (callback)
def save data, options = {}, &callback
    # do something here
```

```imba
# Именованные параметры
def animate values, ease: 'linear', duration: 1
    # do something here
```



## Blocks

```imba
var square = do |v| v * v
```


Блоки похожи на анонимные функции в JavaScript. Их можно присваивать и передавать. Они имеют свою собственную лексическую область видимости / замыкание, но нет динамической области видимости. Это означает, что self (как неявный, так и явный) внутри блока все еще ссылается на self внешней области видимости.

Блоки могут быть переданы непосредственно при вызове функций, в качестве последнего аргумента.


```imba
[1,2,3,4].map do |num| num * 2

item.save do
    # callback trigger when item is saved?
    console.log 'item was saved'
```
