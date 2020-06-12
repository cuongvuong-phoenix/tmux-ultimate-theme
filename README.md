# Tmux Ultimate theme

A dark theme for [tmux](https://github.com/tmux/tmux/wiki)'s status bar.

## Table of Contents

1.  [Introduction](#introduction)
2.  [Requirements](#requirements)
3.  [Installation](#installation)
    -   [Installation with Tmux Plugin Manager](#installation-with-tmux-plugin-manager)
    -   [Manual Installation](#manual-installation)
4.  [List features support](#list-features-support)
5.  [Configuration](#configuration)
6.  [Known Issues](#known-issues)

## Introduction

This theme is based on some features of [Dracula tmux's theme](https://github.com/dracula/tmux).

## Requirements

-   **Tmux** **_version 2.5+_**, running inside Linux, Mac, OpenBSD.
-   For **Linux** & **OpenBSD**:

    -   _cut_, _tr_, _grep_, _sed_, _awk_, _iw_, _ip_, _jq_, _sysstat_ (for _mpstat_ command), _procps_ (for _free_ command).
    -   **_bash_**.
        > Most of these packages are already inside of your distro. You can check for each one by running command `$ command -v <name of package>`

-   For **Mac**:

    -   _cut_, _grep_, _sed_, _pmset_
    -   **_bash_**.

-   [**Nerd Font**](https://github.com/ryanoasis/nerd-fonts) (mine is [**_FiraCode Nerd Font_**](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)).
-   A **Terminal** that support **True color** (mine is [**_Alacritty_**](https://github.com/alacritty/alacritty) with ligatures support).
    -   Remember to [turn it on inside **Tmux**](https://bruinsslot.jp/post/how-to-enable-true-color-for-neovim-tmux-and-gnome-terminal/)

## Installation

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

-   Add plugin to the list of TPM plugins in your `.tmux.conf`:

    ```shell
    set -g @plugin 'vuong-cuong-phoenix/tmux-ultimate-theme'
    ```

-   Reload your `.tmux.conf`:

    ```shell
    $ tmux source <path to your .tmux.conf file>
    ```

-   Install the plugin by `prefix + I`

### Manual Installation

-   Clone the repo:
    ```shell
    $ git clone https://github.com/vuong-cuong-phoenix/tmux-ultimate-theme.git <your path>
    ```
-   Add this line to the bottom of your `.tmux.conf`:

    ```shell
    run-shell <your path>/tmux-ultimate-theme.tmux
    ```

-   Reload your `.tmux.conf`:
    ```shell
    $ tmux source <path to your .tmux.conf file>
    ```

## List features support

| **Feature**                                                            | **Linux/OpenBSD support** |  **Mac support**   | **Window's Cygwin, MinGW, MSYS** |
| ---------------------------------------------------------------------- | :-----------------------: | :----------------: | :------------------------------: |
| Show [Powerline](https://github.com/ryanoasis/powerline-extra-symbols) |    :heavy_check_mark:     | :heavy_check_mark: |        :heavy_check_mark:        |
| Show prefix                                                            |    :heavy_check_mark:     | :heavy_check_mark: |        :heavy_check_mark:        |
| CPU & Memory usage info                                                |    :heavy_check_mark:     | :white_check_mark: |        :white_check_mark:        |
| Date & Time                                                            |    :heavy_check_mark:     | :heavy_check_mark: |        :heavy_check_mark:        |
| Network's IPv4 address                                                 |    :heavy_check_mark:     | :white_check_mark: |        :white_check_mark:        |
| Network's SSID                                                         |    :heavy_check_mark:     | :heavy_check_mark: |        :white_check_mark:        |
| Battery                                                                |    :heavy_check_mark:     | :heavy_check_mark: |        :white_check_mark:        |

## Configuration

You can customize to your needs by changing these options in `.tmux.conf`:

### Colors settings

---

#### Set your favourite `BLACK` color

-   _Command_: `set -g @ultimate-theme-color-black <your color : string>`
-   _Default_: `#232627`.
-   _Depending on_: None.

#### Set your favourite `WHITE` color

-   _Command_: `set -g @ultimate-theme-color-white <your color : string>`
-   _Default_: `#fcfcfc`.
-   _Depending on_: None.

#### Set your favourite `RED` color

-   _Command_: `set -g @ultimate-theme-color-red <your color: string>`
-   _Default_: `#ed1515`.
-   _Depending on_: None.

#### Set your favourite `GREEN` color

-   _Command_: `set -g @ultimate-theme-color-green <your color : string>`
-   _Default_: `#11d418`.
-   _Depending on_: None.

#### Set your favourite `YELLOW` color

-   _Command_: `set -g @ultimate-theme-color-yellow <your color : string>`
-   _Default_: `#E5C07B`.
-   _Depending on_: None.

#### Set your favourite `ORANGE` color

-   _Command_: `set -g @ultimate-theme-color-orange <your color : string>`
-   _Default_: `#f67400`.
-   _Depending on_: None.

#### Set your favourite `BLUE` color

-   _Command_: `set -g @ultimate-theme-color-blue <your color : string>`
-   _Default_: `#45a1ed`.
-   _Depending on_: None.

#### Set your favourite `MAGENTA` color

-   _Command_: `set -g @ultimate-theme-color-magenta <your color: string>`
-   _Default_: `#9b59b6`.
-   _Depending on_: None.

#### Set your favourite `PINK` color

-   _Command_: `set -g @ultimate-theme-color-pink <your color: string>`
-   _Default_: `#ff79c6`.
-   _Depending on_: None.

#### Set your favourite `CYAN` color

-   _Command_: `set -g @ultimate-theme-color-cyan <your color: string>`
-   _Default_: `#18b495`.
-   _Depending on_: None.

#### Set your favourite `GREY` color

-   _Command_: `set -g @ultimate-theme-color-grey <your color: string>`
-   _Default_: `#C1C4C3`.
-   _Depending on_: None.

#### Set your favourite `DARK_GREY` color

-   _Command_: `set -g @ultimate-theme-color-dark-grey <your color: string>`
-   _Default_: `#3e4452`.
-   _Depending on_: None.

### Optionals

---

#### Choose to show [Powerline symbols](#list-features-support)

-   _Command_: `set -g @ultimate-theme-show-powerline <your choice: boolean>`
-   _Default_: `true`
-   _Depending on_: None

#### Choose to show [Prefix](#list-features-support)

-   _Command_: `set -g @ultimate-theme-show-prefix <your choice: boolean>`
-   _Default_: `true`
-   _Depending on_: None

#### Choose to show [CPU & Memory usage info](#list-features-support)

-   _Command_: `set -g @ultimate-theme-show-cpu-mem-info <your choice: boolean>`
-   _Default_: `true`
-   _Depending on_: None

#### Choose to show [Date & Time](#list-features-support)

-   _Command_: `set -g @ultimate-theme-show-date-time <your choice: boolean>`
-   _Default_: `true`
-   _Depending on_: None

#### Choose to show [Network's IPv4 address](#list-features-support)

-   _Command_: `set -g @ultimate-theme-show-network-ip-address <your choice: boolean>`
-   _Default_: `false`
-   _Depending on_: None

#### Choose to show [Network's SSID](#list-features-support)

-   _Command_: `set -g @ultimate-theme-show-network-id <your choice: boolean>`
-   _Default_: `true`
-   _Depending on_: None

#### Choose to show [Battery](#list-features-support)

-   _Command_: `set -g @ultimate-theme-show-battery <your choice: boolean>`
-   _Default_: `true`
-   _Depending on_: None

### Format information

---

#### Set clock format based on [strftime](http://www.strfti.me/)

-   _Command_: `set -g @ultimate-theme-clock-format <your format: string>`
-   _Default_: `%H:%M`
-   _Depending on_: None

#### Set date format based on [strftime](http://www.strfti.me/)

-   _Command_: `set -g @ultimate-theme-date-format <your format: string>`
-   _Default_: `%a, %e/%m/%Y`
-   _Depending on_: None

### Icon/Symbol settings

---

#### Set _Powerline's icon_ for _left side of status bar_

-   _Command_: `set -g @ultimate-theme-powerline-left-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uE0B0'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-powerline`](#choose-to-show-powerline-symbols)

#### Set _Powerline's thin icon_ for _left side of status bar_

-   _Command_: `set -g @ultimate-theme-powerline-left-icon-thin <your symbol/icon: string>`
-   _Default_: `` (or `u'\uE0B1'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-powerline`](#choose-to-show-powerline-symbols)

#### Set _Powerline's icon_ for _right side of status bar_

-   _Command_: `set -g @ultimate-theme-powerline-right-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uE0B2'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-powerline`](#choose-to-show-powerline-symbols)

#### Set _Powerline's thin icon_ for _right side of status bar_

-   _Command_: `set -g @ultimate-theme-powerline-right-icon-thin <your symbol/icon: string>`
-   _Default_: `` (or `u'\uE0B3'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-powerline`](#choose-to-show-powerline-symbols)

#### Set your favourite _Prefix's_ symbol

-   _Command_: `set -g @ultimate-theme-prefix-symbol <your symbol/icon: string>`
-   _Default_: `` (or `u'\uF73F'` Nerd font hex code).
-   _Depending on_: [`@ultimate-theme-show-prefix`.](#choose-to-show-prefix)

#### Set [CPU & Memory usage info](#list-features-support) icon

-   _Command_: `set -g @ultimate-theme-cpu-mem-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uF85A'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-cpu-mem-info`](#choose-to-show-cpu--memory-usage-info)

#### Set icon of [Clock (Time)](#list-features-support) when in _DC (Direct Current)_ mode

-   _Command_: `set -g @ultimate-theme-clock-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uF017'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-date-time`](#choose-to-show-date--time)

#### Set icon of [Date](#list-features-support) when in _DC (Direct Current)_ mode

-   _Command_: `set -g @ultimate-theme-date-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uF073'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-date-time`](#choose-to-show-date--time)

#### Set icon of [Network](#list-features-support) when _Offline_

-   _Command_: `set -g @ultimate-theme-network-offline-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uF65A'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-network-id`](#choose-to-show-networks-ssid)

#### Set icon of [Network](#list-features-support) when in _Ethernet_ mode

-   _Command_: `set -g @ultimate-theme-network-ethernet-icon <your symbol/icon: string>`
-   _Default_: `ﯱ` (or `u'\uFBF1'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-network-id`](#choose-to-show-networks-ssid)

#### Set icon of [Network](#list-features-support) when in _Wifi_ mode

-   _Command_: `set -g @ultimate-theme-network-wifi-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uF1EB'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-network-id`](#choose-to-show-networks-ssid)

#### Set icon of [Battery](#list-features-support) when in _DC (Direct Current)_ mode

-   _Command_: `set -g @ultimate-theme-battery-discharging-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uF583'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-battery`](#choose-to-show-battery)

#### Set icon of [Battery](#list-features-support) when in _AC (Alternating Current)_ mode

-   _Command_: `set -g @ultimate-theme-battery-ac-icon <your symbol/icon: string>`
-   _Default_: `` (or `u'\uF0E7'` Powerline hex code)
-   _Depending on_: [`@ultimate-theme-show-battery`](#choose-to-show-battery)

## Known Issues
