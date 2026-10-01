# CleanShot X 中文汉化补丁

面向 macOS 的非官方简体中文补丁，在 [CodeApe-Xiaoyin/cleanshotx-cn-patch](https://github.com/CodeApe-Xiaoyin/cleanshotx-cn-patch) 的基础上补充 **CleanShot X 5.0.1** 的新版界面翻译。

本仓库只提供补丁源码、语言文件和脚本，不包含 CleanShot X 应用本体，不修改主程序机器码，也不提供任何授权破解。请先自行安装正版 CleanShot X。

## 兼容性与覆盖范围

| 项目 | 说明 |
| --- | --- |
| 当前补丁版本 | `v5.0.1-cn.1` |
| 本次验证的应用版本 | CleanShot X `5.0.1 (02e6637)` |
| 本次验证环境 | Apple Silicon / arm64，macOS `26.6.2` |
| 编译目标 | macOS 13.0 及以上，按本机架构编译；Intel 和其他系统版本未实测 |
| 上游原有验证版本 | CleanShot X `4.8.8`，本次没有重新验证旧版 |

已检查新版设置页、快捷键名称与分类、快速访问浮层右键菜单、下拉选项、文件名格式标签及部分弹窗。增加 AppKit / SwiftUI 翻译支持，保留快捷键按键值、文件名模板内容和品牌名称。

当前语言文件包含 **2,554 个翻译键**，其中包括冒号、省略号等形式的变体，不代表 2,554 条独立词条。尚未触发的错误提示、登录后的云端界面及未来版本可能仍有遗漏，不能保证 100% 覆盖。

## 安装前须知

- 安装脚本会退出并重启 CleanShot X，请先完成当前截图或录制任务。
- 补丁会向应用包添加动态库和中文语言文件，写入 `Info.plist` 的 `LSEnvironment` 注入配置，并对应用重新进行 ad-hoc 签名。
- 重新签名可能导致 macOS 要求重新授权屏幕录制、辅助功能或输入监听。默认不会主动重置这些权限，也不需要关闭 SIP。
- 默认备份应用的 `Info.plist`、已有补丁动态库和偏好设置文件，不是整个应用的完整备份。需要完整恢复保障时，请另外保留官方安装包。
- 默认安装流程还会修正偏好文件属性并重启系统偏好设置缓存，不删除偏好设置或重置快捷键值。

## 快速安装

### 1. 准备工具和应用

确认 CleanShot X 已安装，默认路径为 `/Applications/CleanShot X.app`，且当前用户可以写入应用目录。

如果尚未安装 Xcode Command Line Tools，在终端运行下面的命令，并完成系统弹出的安装流程：

```zsh
xcode-select --install
```

工具安装完成后，可检查编译器是否可用：

```zsh
xcrun --find clang
xcrun --find swiftc
```

### 2. 下载并安装补丁

```zsh
git clone https://github.com/W79785823/cleanshotx-cn-patch.git
cd cleanshotx-cn-patch
zsh scripts/install.sh
```

也可在 GitHub 仓库页面选择 **Code > Download ZIP**，解压后在该文件夹中运行 `zsh scripts/install.sh`。无需下载他人预编译的动态库，也无需执行 `chmod +x`。

安装成功后，从菜单栏 CleanShot 图标打开 **Settings / 设置** 检查中文界面。若系统要求重新授权，请在系统设置中允许对应权限。

### 不创建备份

明确不需要备份时，使用：

```zsh
BACKUP=0 zsh scripts/install.sh
```

默认安装会在仓库的 `backups/` 文件夹下创建按时间命名的备份。备份、偏好快照和编译产物均已被 `.gitignore` 排除，不会随源码提交上传。

### 自定义应用路径

```zsh
zsh scripts/install.sh "/你的路径/CleanShot X.app"
```

自定义路径与不创建备份可同时使用：

```zsh
BACKUP=0 zsh scripts/install.sh "/你的路径/CleanShot X.app"
```

## 更新补丁或应用

更新本仓库后，重新安装：

```zsh
git pull --ff-only
zsh scripts/install.sh
```

CleanShot X 官方更新或重装通常会覆盖补丁，需要重新运行安装脚本。新版本也可能改变界面文本或 SwiftUI 接口，请先确认兼容性；若安装后出现异常，先卸载补丁，不要反复重置系统权限。

## 卸载与恢复

```zsh
zsh scripts/uninstall.sh
```

自定义应用路径：

```zsh
zsh scripts/uninstall.sh "/你的路径/CleanShot X.app"
```

卸载会移除注入配置、补丁动态库和本补丁添加的中文语言文件，然后重新签名应用。卸载后需自行重新打开 CleanShot X。

**卸载不会恢复官方数字签名。** 如需完全恢复官方原版，请从 CleanShot 官方渠道重新安装应用；仓库中的偏好快照不应当作完整应用备份。

## 常见问题

### 安装后仍然显示英文

确认安装脚本成功完成、已重新启动 CleanShot X，且实际运行的是传给脚本的那个应用。若官方更新覆盖了补丁，重新安装；若只有个别文字未翻译，可在 Issues 中提供应用版本、所在页面和去除个人信息后的截图。

### 提示权限异常

先在 macOS 系统设置中检查 CleanShot X 的屏幕录制、辅助功能和输入监听权限。只有权限记录确实异常、并且接受重新授权时，才使用下面的可选命令：

```zsh
RESET_TCC=1 zsh scripts/install.sh
```

该选项会重置这些权限。正常安装和卸载无需使用它。

### 快捷键或设置异常

以下脚本继承自上游项目，不属于正常汉化所需步骤，请只在对应问题出现时使用：

| 命令 | 用途及影响 |
| --- | --- |
| `zsh scripts/restart-shortcuts.sh` | 重启 CleanShot，重新注册快捷键 |
| `zsh scripts/repair-preferences.sh` | 备份偏好文件，修正文件属性并重启偏好缓存 |
| `zsh scripts/save-preferences-snapshot.sh` | 将当前偏好保存到本机 `snapshots/` |
| `zsh scripts/restore-preferences-snapshot.sh` | 用已有快照覆盖当前偏好，请先确认要恢复的内容 |
| `zsh scripts/fix-shortcut-permissions.sh` | 重置辅助功能和输入监听权限，需要重新授权；不重置屏幕录制 |

不要把含有个人配置的 `backups/` 或 `snapshots/` 文件夹上传到 Issues 或公开仓库。

## 编译与补充翻译

只编译、不安装也不重启 CleanShot：

```zsh
zsh scripts/build.sh
```

输出动态库为 `build/libCleanShotCN.dylib`。中文语言文件由同一份词表生成，位于 `resources/zh-Hans.lproj/Localizable.strings`。

补充翻译时，修改 `src/CleanShotCN.m` 中的 `CNTranslationMap()`，保留 `%@`、`%lld` 等格式占位符，再运行构建脚本。不要直接编辑生成的二进制 `.strings` 文件。重新安装后应检查实际界面，并确认快捷键、文件名模板等可编辑内容没有变化。

本补丁通过 `DYLD_INSERT_LIBRARIES` 加载动态库，使用 AppKit 可见控件翻译、SwiftUI 原生语言资源及 dyld `__interpose` 替换显示文本构造方法；不会改写 CleanShot X 主程序的机器指令。

## 目录结构

```text
src/                         汉化词表、AppKit 与 SwiftUI 显示文本替换
tools/export-strings.m       从共享词表生成中文语言文件
resources/zh-Hans.lproj/     生成的中文语言文件
scripts/build.sh            仅编译
scripts/install.sh          编译并安装
scripts/uninstall.sh        卸载补丁
scripts/                    上游设置与快捷键修复工具
docs/VERSION.txt            版本和验证范围
docs/CHANGELOG.md           更新日志
LICENSE                     MIT 协议
```

## 来源与免责声明

原项目：[CodeApe-Xiaoyin/cleanshotx-cn-patch](https://github.com/CodeApe-Xiaoyin/cleanshotx-cn-patch)。本 fork 从上游提交 `19065d874f11aeb7218824a82a64af9aff5b3051` 扩展，保留原有提交历史与 MIT 协议。

本项目与 CleanShot X、Make The Web 或其开发团队没有关联，仅提供非官方界面翻译，不包含、分发或破解官方软件。请在拥有正版授权的前提下使用；使用风险及适用范围见 [LICENSE](LICENSE)。
