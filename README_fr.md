<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Coin pour YunoHost

[![Niveau d’intégration](https://dash.yunohost.org/integration/coin.svg)](https://dash.yunohost.org/appci/app/coin) ![Statut du fonctionnement](https://ci-apps.yunohost.org/ci/badges/coin.status.svg) ![Statut de maintenance](https://ci-apps.yunohost.org/ci/badges/coin.maintain.svg)

[![Installer Coin avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=coin)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Coin rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

COIN est un système d'information pour FAI associatif dans la FFDN

### Fonctionnalités

- Fourni une interface pour les membres
- Gestion des adhésions
- Gestion des demandes de services tels que VPN, VPS, Housing, compte externe, etc ...
    - gestion des pools d'IP
    - des hooks peuvent être ajoutés à l'interface pour s'interfacer avec la "vraie" infra et provisionner les services depuis l'admin
    - les membres peuvent voir le status et infos de leurs services depuis leur espace
    - gestion des factures, des rappels, import des paiements de la banque, calcul de solde
- Optionnel : gestion de mailing liste, prêt de matériel


**Version incluse :** 20231216~ynh1

## Captures d’écran

![Capture d’écran de Coin](./doc/screenshots/screenshot.png)

## Documentations et ressources

- Site officiel de l’app : <https://code.ffdn.org/FFDN/coin>
- Dépôt de code officiel de l’app : <https://code.ffdn.org/ffdn/coin>
- YunoHost Store : <https://apps.yunohost.org/app/coin>
- Signaler un bug : <https://github.com/YunoHost-Apps/coin_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/coin_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
ou
sudo yunohost app upgrade coin -u https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
