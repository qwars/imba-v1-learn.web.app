

# Imba Router

Для большинства одностраничных приложений рекомендуется использовать библиотеку [imba-router](https://github.com/somebee/imba-router). Посмотрите эту [6-частную интерактивную видеозапись](https://scrimba.com/playlist/pMvYcg) для получения дополнительной информации.

```imba
require 'imba-router'

tag Home
    def render
        <self> "Home"

tag About
    def render
        <self> "About"

tag App
    def render
        <self>
            <header>
                <a route-to='/home'> "Home"
                <a route-to='/about'> "About"
            <Home route='/home'> 
            <About route='/about'>

```



