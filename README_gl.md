<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# Coin para YunoHost

[![Nivel de integración](https://dash.yunohost.org/integration/coin.svg)](https://ci-apps.yunohost.org/ci/apps/coin/) ![Estado de funcionamento](https://ci-apps.yunohost.org/ci/badges/coin.status.svg) ![Estado de mantemento](https://ci-apps.yunohost.org/ci/badges/coin.maintain.svg)

[![Instalar Coin con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=coin)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar Coin de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

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


**Versión proporcionada:** 20231216~ynh2

## Capturas de pantalla

![Captura de pantalla de Coin](./doc/screenshots/screenshot.png)

## Documentación e recursos

- Web oficial da app: <https://code.ffdn.org/FFDN/coin>
- Repositorio de orixe do código: <https://code.ffdn.org/ffdn/coin>
- Tenda YunoHost: <https://apps.yunohost.org/app/coin>
- Informar dun problema: <https://github.com/YunoHost-Apps/coin_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/coin_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
ou
sudo yunohost app upgrade coin -u https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>
