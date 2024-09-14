<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Coin YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/coin.svg)](https://ci-apps.yunohost.org/ci/apps/coin/) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/coin.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/coin.maintain.svg)

[![Instalatu Coin YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=coin)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Coin YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

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


**Paketatutako bertsioa:** 20240914~ynh1

## Pantaila-argazkiak

![Coin(r)en pantaila-argazkia](./doc/screenshots/screenshot.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://code.ffdn.org/FFDN/coin>
- Jatorrizko aplikazioaren kode-gordailua: <https://code.ffdn.org/ffdn/coin>
- YunoHost Denda: <https://apps.yunohost.org/app/coin>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/coin_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/coin_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
edo
sudo yunohost app upgrade coin -u https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
