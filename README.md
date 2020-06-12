# Tmux Ultimate theme

A dark theme for [tmux](https://github.com/tmux/tmux/wiki)'s status bar.

## Table of Contents

1.  [Introduction](#introduction)
2.  [Requirements](#requirements)
3.  [Installation](#installation)
    -   [Installation with Tmux Plugin Manager](#installation-with-tmux-plugin-manager-recommended)
    -   [Manual Installation](#manual-installation)
4.  [List OS support](#list-os-support)
5.  [Configuration](#configuration)
    -   [Color](#color)
    -   [Optional](#optional)
    -   [Format information](#format-information)
    -   [Icon/Symbol](#iconsymbol)
6.  [Known Issues](#known-issues)

## Introduction

![Demo image](./demo.png)

This theme is based on some features of [Dracula tmux's theme](https://github.com/dracula/tmux).

## Requirements

-   **Tmux** **_version 2.5+_**, running inside Linux, Mac, OpenBSD.
-   For **Linux** & **OpenBSD**:

    -   **_bash_**, **_cut_**, **_tr_**, **_grep_**, **_sed_**, **_awk_**: _Essentials_.
    -   **_jq_**, **_sysstat_**, **procps**: For [CPU & Memory usage info](#list-features-support).
    -   **_iw_**: For [Network's SSID](#list-features-support).
    -   **_ip_**: For [Network's IPv4 address](#list-features-support).
    -   **_acpi_**: For [Battery info](#list-features-support).
        > All these packages should have already been installed by default on your distro. You can check for each one by running command `$ command -v <name of package>`

-   For **Mac**:

    -   **_bash_**, **_cut_**, **_grep_**, **_sed_**: _Essentials_
    -   **_pmset_**: For [Battery info](#list-features-support)
        > All these packages should have already been installed by default on Mac. You can check for each one by running command `$ command -v <name of package>`

-   [**Nerd Font**](https://github.com/ryanoasis/nerd-fonts) (mine is [**_FiraCode Nerd Font_**](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)).
-   A **Terminal** that support **True color** (mine is [**_Alacritty_**](https://github.com/alacritty/alacritty) with ligatures support).
    > Remember to [turn it on inside **Tmux**](https://bruinsslot.jp/post/how-to-enable-true-color-for-neovim-tmux-and-gnome-terminal/)

## Installation

> Only choose 1 of 2 methods.

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

## List OS support

| **Feature**                                                                    | **Linux/OpenBSD**  |      **Mac**       | **Window's Cygwin, MinGW, MSYS** |
| ------------------------------------------------------------------------------ | :----------------: | :----------------: | :------------------------------: |
| Show [Powerline symbols](https://github.com/ryanoasis/powerline-extra-symbols) | :heavy_check_mark: | :heavy_check_mark: |        :heavy_check_mark:        |
| Show prefix whenever press                                                     | :heavy_check_mark: | :heavy_check_mark: |        :heavy_check_mark:        |
| CPU & Memory usage info                                                        | :heavy_check_mark: | :white_check_mark: |        :white_check_mark:        |
| Date & Time                                                                    | :heavy_check_mark: | :heavy_check_mark: |        :heavy_check_mark:        |
| Network's IPv4 address                                                         | :heavy_check_mark: | :heavy_check_mark: |        :white_check_mark:        |
| Network's SSID                                                                 | :heavy_check_mark: | :heavy_check_mark: |        :white_check_mark:        |
| Battery info                                                                   | :heavy_check_mark: | :heavy_check_mark: |        :white_check_mark:        |

## Configuration

You can customize to your needs by changing these options in `.tmux.conf`:

```shell
set -g <option's name> <new value>
```

### Color

| **Option's name**                 | **Description**                      | **Default value** |
| --------------------------------- | ------------------------------------ | :---------------: |
| `@ultimate-theme-color-black`     | Set your favourite `BLACK` color     |     `#232627`     |
| `@ultimate-theme-color-white`     | Set your favourite `WHITE` color     |     `#fcfcfc`     |
| `@ultimate-theme-color-red`       | Set your favourite `RED` color       |     `#ed1515`     |
| `@ultimate-theme-color-green`     | Set your favourite `GREEN` color     |     `#11d418`     |
| `@ultimate-theme-color-yellow`    | Set your favourite `YELLOW` color    |     `#E5C07B`     |
| `@ultimate-theme-color-orange`    | Set your favourite `ORANGE` color    |     `#f67400`     |
| `@ultimate-theme-color-blue`      | Set your favourite `BLUE` color      |     `#45a1ed`     |
| `@ultimate-theme-color-magenta`   | Set your favourite `MAGENTA` color   |     `#9b59b6`     |
| `@ultimate-theme-color-pink`      | Set your favourite `PINK` color      |     `#ff79c6`     |
| `@ultimate-theme-color-cyan`      | Set your favourite `CYAN` color      |     `#18b495`     |
| `@ultimate-theme-color-grey`      | Set your favourite `GREY` color      |     `#C1C4C3`     |
| `@ultimate-theme-color-dark-grey` | Set your favourite `DARK_GREY` color |     `#3e4452`     |

### Optional

| **Option's name**                         | **Description**                                                         | **Default value** |
| ----------------------------------------- | ----------------------------------------------------------------------- | :---------------: |
| `@ultimate-theme-show-powerline`          | Choose to show [Powerline symbols](#list-features-support) or not       |      `true`       |
| `@ultimate-theme-show-prefix`             | Choose to show [Prefix](#list-features-support) or not                  |      `true`       |
| `@ultimate-theme-show-cpu-mem-info`       | Choose to show [CPU & Memory usage info](#list-features-support) or not |      `true`       |
| `@ultimate-theme-show-date-time`          | Choose to show [Date & Time](#list-features-support) or not             |      `true`       |
| `@ultimate-theme-show-network-ip-address` | Choose to show [Network's IPv4 address](#list-features-support) or not  |      `true`       |
| `@ultimate-theme-show-network-id`         | Choose to show [Network's SSID](#list-features-support) or not          |      `true`       |
| `@ultimate-theme-show-battery`            | Choose to show [Battery info](#list-features-support) or not            |      `true`       |

### Format information

| **Option's name**              | **Description**                                                | **Default value** |
| ------------------------------ | -------------------------------------------------------------- | :---------------: |
| `@ultimate-theme-clock-format` | Set **Time** format based on [strftime](http://www.strfti.me/) |      `%H:%M`      |
| `@ultimate-theme-date-format`  | Set **Date** format based on [strftime](http://www.strfti.me/) |  `%a, %e/%m/%Y`   |

### Icon/Symbol

| **Option's name**                           | **Description**                                                     | **Default value**  |
| ------------------------------------------- | ------------------------------------------------------------------- | :----------------: |
| `@ultimate-theme-powerline-left-icon`       | Set **Powerline's icon** for **_left side of status bar_**          | `` or `u'\uE0B0'` |
| `@ultimate-theme-powerline-left-icon-thin`  | Set **Powerline's thin icon** for **_left side of status bar_**     | `` or `u'\uE0B1'` |
| `@ultimate-theme-powerline-right-icon`      | Set **Powerline's icon** for **_right side of status bar_**         | `` or `u'\uE0B2'` |
| `@ultimate-theme-powerline-right-icon-thin` | Set **Powerline's thin icon** for **_right side of status bar_**    | `` or `u'\uE0B3'` |
| `@ultimate-theme-window-pane-icon`          | Set icon of **Window : Pane** in left status bar                    |  `` or `u/uF2D2`  |
| `@ultimate-theme-prefix-symbol`             | Set your favourite **Prefix** symbol                                | `` or `u'\uF73F'` |
| `@ultimate-theme-cpu-mem-icon`              | Set icon of **CPU & Memory usage info**                             | `` or `u'\uF85A'` |
| `@ultimate-theme-time-icon`                 | Set icon of **Time**                                                | `` or `u'\uF017'` |
| `@ultimate-theme-date-icon`                 | Set icon of **Date**                                                | `` or `u'\uF073'` |
| `@ultimate-theme-network-offline-icon`      | Set icon of **Network info** when in **_Offline_** mode             | `` or `u'\uF65A'` |
| `@ultimate-theme-network-ethernet-icon`     | Set icon of **Network info** when in **_Ethernet_** mode            | `ﯱ` or `u'\uFBF1'` |
| `@ultimate-theme-network-wifi-icon`         | Set icon of **Network** when in **_Wifi_** mode                     | `` or `u'\uF1EB'` |
| `@ultimate-theme-battery-discharging-icon`  | Set icon of **Battery info** when in **_DC (Direct Current)_** mode | `` or `u'\uF583'` |

## Known Issues
