# События мыши и касания (Touch Events)

Объединяет события мыши и касания (Touch Events). Объекты касания (Touch objects) сохраняются на протяжении всего касания, от touchstart до завершения/отмены. Когда касание начинается, оно проходит вниз от самой внутренней цели (target) до тех пор, пока не найдет узел, отвечающий на событие ontouchstart. Если касание явно не перенаправляется, оно вызывает события ontouchmove и ontouchend / ontouchcancel на реагирующем узле (responder) в соответствующих случаях.

```imba
tag DraggableItem
    # called when a touch starts
    def ontouchstart touch
        flag 'dragging'
        self

    # called when touch moves - same touch object
    def ontouchmove touch
        # move the node with touch
        css top: touch.dy, left: touch.dx

    # called when touch ends
    def ontouchend touch
        unflag 'dragging'

    # called if touch is cancelled
    def ontouchcancel touch
        unflag 'dragging'

```

> oСобытия ontouchmove, ontouchend и ontouchcancel не всплывают (не происходят bubbling), как обычные события. Элемент, на котором было вызвано событие ontouchstart, захватывает событие касания, и все будущие события (move, end, cancel) будут вызываться на этом элементе.

- Объясните, в чем отличие событий касания (touch) от обычных событий

> Хотя обработчики касания (touch handlers) объявляются таким же образом, как и обычные обработчики событий,

### Методы

#### `touch.extend(plugin)`

Расширьте работу событий касания, добавив плагин/жест. Все события (touchstart, move и т.д.) для данного события касания будут вызваны на плагинах в порядке их добавления.

Example

#### `touch.x`

Горизонтальное положение касания.

#### `touch.y`

Вертикальное положение касания.

#### `touch.dx`

Расстояние, на которое касание переместилось по горизонтали.

#### `touch.dy`

The absolute distance the touch has moved from starting position

#### `touch.dr`

Абсолютное расстояние, на которое касание переместилось от начальной позиции.

#### `touch.button`

Кнопка, нажатая в этом касании. Встроенные касания по умолчанию соответствуют левой кнопке мыши (left-click).
