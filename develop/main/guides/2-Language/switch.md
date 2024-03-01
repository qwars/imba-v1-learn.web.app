
# Switch

Вы можете использовать операторы switch в Imba двумя способами:

```
var number = 1
var numberString = switch number
  when 0
    "zero"
  when 1
    "one"
  else
    "not 1 nor 0"

# compact 
var numberString2 = switch number
  when 0 then "zero"
  when 1 then "one"
  else "not 1 nor 0"

# you can also mix them
var numberString3 = switch number
  when 0 then "zero"
  when 1
    "one"
  else "not 1 nor 0"

```

Как видите, else используется вместо default. Не более ли это понятно?
