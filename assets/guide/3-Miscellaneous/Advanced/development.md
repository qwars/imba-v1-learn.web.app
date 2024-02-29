---
title: Development
order: 1
---

# Development

Компилятор Imba написан на самом языке Imba, с использованием измененной версии генератора парсера [Jison](https://github.com/zaach/jison). Командная строка imba доступна как утилита Node.js. Сам компилятор не зависит от Node и может быть запущен в любой среде JavaScript или в браузере.

Make sure you have the following tools installed 

- [Node.js](https://nodejs.org/en/)
- [yarn][y] or [npm][n].

[y]: https://yarnpkg.com/lang/en/
[n]: https://www.npmjs.com

All the code for the language is available on [GitHub](https://github.com/imba/imba)

```bash
# use https
git clone https://github.com/imba/imba.io
# or ssh
git@github.com:imba/imba.io.git
cd imba
yarn # npm install
```

## Making Changes

Если вы собираетесь исправить новую ошибку или добавить улучшение, пожалуйста, убедитесь, что вы обновили набор тестов, добавив тесты, охватывающие ваш код. В зависимости от ваших изменений вам возможно нужно будет расширить один из [существующих тестов](https://github.com/imba/imba/tree/master/test). Если вам нужно создать новый тест, ознакомьтесь с файлом [test/index.imba](https://github.com/imba/imba/blob/master/test/index.imba).


## Running the Tests

Для запуска тестов предусмотрены несколько скриптов. В CI (Continuous Integration) все они выполняются автоматически, но вы можете сэкономить некоторое время, запустив их локально и исправив все проблемы перед открытием pull request (запроса на включение изменений).

## Test Imba

```bash
yarn run test # npm run test
```

## Imbapack and Webpack Tests

```bash
yarn run test-webpack # npm run test-webpack
```

## Google Chrome Tests via Puppeteer

```bash
yarn run test-chrome # npm run test-chrome
```
