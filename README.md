# BSP layer for updating Raspberry Pi with OSTree

OSTree bootloader integration for Raspberry Pi. Add it to BBLAYERS when using [meta-updater](https://github.com/advancedtelematic/meta-updater) with [Raspberry Pi](https://github.com/agherzan/meta-raspberrypi).

For more documentation on using this layer and [HERE OTA Connect](https://connect.ota.here.com/), please see the [OTA Connect documentation portal](https://docs.ota.here.com/), in particular the guide on [building a Raspberry Pi image](https://docs.ota.here.com/ota-client/latest/build-raspberry.html).

## Wi-Fi enablement for Raspberry Pi

| Name | Default | Description |
|---|---|---|
| RPI_WIFI_ENABLE | "0" | A flag to enable ("1") or disable "0" WiFi support (drivers and configuration). |
| RPI_WIFI_SSID | N/A| ID of a wireless network to connect to. Be aware this is case sensitive! Mandatory if RPI_WIFI_ENABLE is "1". |
| RPI_WIFI_PWD | N/A |  Password for a connection to a wireless network. |

