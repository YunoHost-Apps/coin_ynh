<!--
注意：此 README 由 <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> 自动生成
请勿手动编辑。
-->

# YunoHost 上的 Coin

[![集成程度](https://apps.yunohost.org/badge/integration/coin)](https://ci-apps.yunohost.org/ci/apps/coin/)
![工作状态](https://apps.yunohost.org/badge/state/coin)
![维护状态](https://apps.yunohost.org/badge/maintained/coin)

[![使用 YunoHost 安装 Coin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=coin)

*[阅读此 README 的其它语言版本。](./ALL_README.md)*

> *通过此软件包，您可以在 YunoHost 服务器上快速、简单地安装 Coin。*  
> *如果您还没有 YunoHost，请参阅[指南](https://yunohost.org/install)了解如何安装它。*

## 概况

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


**分发版本：** 20240914~ynh1

## 截图

![Coin 的截图](./doc/screenshots/screenshot.png)

## 文档与资源

- 官方应用网站： <https://code.ffdn.org/FFDN/coin>
- 上游应用代码库： <https://code.ffdn.org/ffdn/coin>
- YunoHost 商店： <https://apps.yunohost.org/app/coin>
- 报告 bug： <https://github.com/YunoHost-Apps/coin_ynh/issues>

## 开发者信息

请向 [`testing` 分支](https://github.com/YunoHost-Apps/coin_ynh/tree/testing) 发送拉取请求。

如要尝试 `testing` 分支，请这样操作：

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
或
sudo yunohost app upgrade coin -u https://github.com/YunoHost-Apps/coin_ynh/tree/testing --debug
```

**有关应用打包的更多信息：** <https://yunohost.org/packaging_apps>
