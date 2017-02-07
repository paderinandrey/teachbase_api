# Приложение для работы с API Teachbase

Тестовое приложение для отображения списка открытых курсов в Teachbase. 

## Требования к реализации:

* Список курсов должен быть с постраничной навигацией.

## Авторизация

Приложение позволяет работать с любым аккаунтом Teachbase,
для этого необходимо в процессе авторизации передать API key.

Процесс авторизации можно посмотреть здесь: [github.com](https://github.com/doorkeeper-gem/doorkeeper/wiki/Client-Credentials-flow)

Описание API можно посмотреть здесь: [s1.teachbase.ru](http://s1.teachbase.ru/lurker)
Для получения списка курсов аккаунта, можно воспользоваться методом, описаным здесь: [s1.teachbase.ru](http://s1.teachbase.ru/lurker/endpoint/v1/course_sessions-GET.html)

## Важные моменты:

* если запрос в API Teachbase не был успешным, то показываем на странице последнюю успешно загруженную копию списка (первой страницы, без возможности переключения по страницам) и сообщение `"В данный момент Teachbase недоступен. Загружена копия от ..."`;

* отслеживать долгий простой сервера Teachbase и не делать лишние запросы к API, если Teachbase лежит, а сразу показывать копию + сообщение о том, что `"Teachbase лежит уже X часов"`;

## Развёртывание приложения
```
# bundle install
# rake bower:install
# Create config/database.yml, configure it for postgresql
# Create config/secrets.yml, configure it for authorization on Teachbase API
# rake db:create
# rake db:migrate
# rspec
# rubocop
```
