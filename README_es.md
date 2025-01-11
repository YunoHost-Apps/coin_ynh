<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# Coin para Yunohost

[![Nivel de integración](https://apps.yunohost.org/badge/integration/coin)](https://ci-apps.yunohost.org/ci/apps/coin/)
![Estado funcional](https://apps.yunohost.org/badge/state/coin)
![Estado En Mantención](https://apps.yunohost.org/badge/maintained/coin)

[![Instalar Coin con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=coin)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarCoin rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

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


**Versión actual:** 20240914~ynh1

## Capturas

![Captura de Coin](./doc/screenshots/screenshot.png)

## Documentaciones y recursos

- Sitio web oficial: <https://code.ffdn.org/FFDN/coin>
- Repositorio del código fuente oficial de la aplicación : <https://code.ffdn.org/ffdn/coin>
- Catálogo YunoHost: <https://apps.yunohost.org/app/coin>
- Reportar un error: <https://github.com/YunoHost-Apps/coin_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [rama `testing`](https://github.com/YunoHost-Apps/coin_ynh/tree/testing).

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
o
sudo yunohost app upgrade coin -u https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
