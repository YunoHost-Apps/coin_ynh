<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# Coin voor Yunohost

[![Integratieniveau](https://apps.yunohost.org/badge/integration/coin)](https://ci-apps.yunohost.org/ci/apps/coin/)
![Mate van functioneren](https://apps.yunohost.org/badge/state/coin)
![Onderhoudsstatus](https://apps.yunohost.org/badge/maintained/coin)

[![Coin met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=coin)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je Coin snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

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


**Geleverde versie:** 20240914~ynh1

## Schermafdrukken

![Schermafdrukken van Coin](./doc/screenshots/screenshot.png)

## Documentatie en bronnen

- Officiele website van de app: <https://code.ffdn.org/FFDN/coin>
- Upstream app codedepot: <https://code.ffdn.org/ffdn/coin>
- YunoHost-store: <https://apps.yunohost.org/app/coin>
- Meld een bug: <https://github.com/YunoHost-Apps/coin_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/coin_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
of
sudo yunohost app upgrade coin -u https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
