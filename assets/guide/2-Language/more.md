---
title: Await
order: 7
---

# Await

Imba поддерживает ключевое слово await, которое компилируется напрямую в async/await в JavaScript. Единственная разница заключается в том, что вам не нужно помечать ваши функции как async. Любая функция, содержащая оператор await, автоматически будет скомпилирована в асинхронную функцию.


#### await
```imba
def load url
    var res = await window.fetch url
    return res.json

var data = await load "/some/url"
```

#### Without await
```imba
def load url
    window.fetch(url).then do |res|
        return res.json

load("/some/url").then do |data|
    # do something with data
```

> Ключевое слово async/await уже поддерживается во всех основных браузерах. Если вы ориентируетесь на пользователей IE11, вам потребуется использовать Babel для компиляции кода.
