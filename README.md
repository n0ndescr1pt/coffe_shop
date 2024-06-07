## Сoffee Shop
Это мобильное приложение, которое обладает функциями
   - Отображение меню кофейни
   - Создание заказа
   - Загрузка меню из БД если нет доступа в интернет
   - Карта кофеен города
   - Локализацию для Русского и Английского

## Технологии

В разработке данного приложения были использованы следующие технологии:

- [Flutter](https://flutter.dev/) - кроссплатформенный фреймворк для создания мобильных приложений.
- [Dart](https://dart.dev/) - язык программирования, используемый в Flutter.
- [Yandex maps](https://pub.dev/packages/yandex_mapkit) - Библиотека карт

Версии:

![Code_h2qyUm3ZG2](https://github.com/n0ndescr1pt/flutterMessanger/assets/112966572/87af679c-335b-43e3-a5f6-8b54a858448a)
![image](https://github.com/n0ndescr1pt/coffeShop/assets/112966572/1f1be4d4-fb28-4371-9457-b781c106067f)

## Запуск приложения

Для запуска приложения на вашем устройстве или эмуляторе, выполните следующее:

1. Убедитесь, что у вас установлен flutter и dart sdk.

2. Клонируйте репозиторий с исходным кодом приложения:

   git clone https://github.com/n0ndescr1pt/coffeShop.git


3. Установите зависимости:

   `flutter pub get`

5. Запустите приложение:

   `flutter run`

   Это запустит приложение на подключенном устройстве или эмуляторе.

## Скриншоты
<table>
  <tr>
    <td><img src="https://github.com/n0ndescr1pt/coffeShop/assets/112966572/24863f02-c907-4373-8d86-f2a8fa08b128" height = 300/></td>
    <td><img src="https://github.com/n0ndescr1pt/coffeShop/assets/112966572/a189b330-3ab6-4426-8ab0-c4b9a58df284" height = 300/></td>
     <td><img src="https://github.com/n0ndescr1pt/coffeShop/assets/112966572/66ff704d-0c82-4753-9a71-637c2071641e" height = 300/></td>
    <td><img src="https://github.com/n0ndescr1pt/coffeShop/assets/112966572/0ea8d071-92a3-4587-b48c-668377129d90" height = 300/></td>
</table>






## Известные проблемы

1. Отсутсвует кластеризация поинтов на карте.
2. Из за того что я использую GridView в моем случае трудно реализовать пагинацию
