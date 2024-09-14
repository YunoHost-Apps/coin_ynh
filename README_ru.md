<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# Coin для YunoHost

[![Уровень интеграции](https://dash.yunohost.org/integration/coin.svg)](https://ci-apps.yunohost.org/ci/apps/coin/) ![Состояние работы](https://ci-apps.yunohost.org/ci/badges/coin.status.svg) ![Состояние сопровождения](https://ci-apps.yunohost.org/ci/badges/coin.maintain.svg)

[![Установите Coin с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=coin)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить Coin быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

COIN is an Information System designed for associative ISPs in the FFDN.

### Features

- Provide a nice, clean UI for members
- Manage memberships
- Handle service requests for VPN, VPS, Housing, external accounts, etc,
    - including IP pools management
    - custom hooks can be added to interface with the actual infrastructure and provision services from the admin
    - members can get status info regarding their services
    - handle invoices, send reminders, import payment from bank, derive a member balance
- Optional features: mailing list, hardware provisionning


**Поставляемая версия:** 20240914~ynh1

## Снимки экрана

![Снимок экрана Coin](./doc/screenshots/screenshot.png)

## Документация и ресурсы

- Официальный веб-сайт приложения: <https://code.ffdn.org/FFDN/coin>
- Репозиторий кода главной ветки приложения: <https://code.ffdn.org/ffdn/coin>
- Магазин YunoHost: <https://apps.yunohost.org/app/coin>
- Сообщите об ошибке: <https://github.com/YunoHost-Apps/coin_ynh/issues>

## Информация для разработчиков

Пришлите Ваш запрос на слияние в [ветку `testing`](https://github.com/YunoHost-Apps/coin_ynh/tree/testing).

Чтобы попробовать ветку `testing`, пожалуйста, сделайте что-то вроде этого:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
или
sudo yunohost app upgrade coin -u https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
```

**Больше информации о пакетировании приложений:** <https://yunohost.org/packaging_apps>
