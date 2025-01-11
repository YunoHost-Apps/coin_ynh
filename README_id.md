<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# Coin untuk YunoHost

[![Tingkat integrasi](https://dash.yunohost.org/integration/coin.svg)](https://ci-apps.yunohost.org/ci/apps/coin/) ![Status kerja](https://ci-apps.yunohost.org/ci/badges/coin.status.svg) ![Status pemeliharaan](https://ci-apps.yunohost.org/ci/badges/coin.maintain.svg)

[![Pasang Coin dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=coin)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang Coin secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

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


**Versi terkirim:** 20240914~ynh1

## Tangkapan Layar

![Tangkapan Layar pada Coin](./doc/screenshots/screenshot.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://code.ffdn.org/FFDN/coin>
- Depot kode aplikasi hulu: <https://code.ffdn.org/ffdn/coin>
- Gudang YunoHost: <https://apps.yunohost.org/app/coin>
- Laporkan bug: <https://github.com/YunoHost-Apps/coin_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/coin_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
atau
sudo yunohost app upgrade coin -u https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
