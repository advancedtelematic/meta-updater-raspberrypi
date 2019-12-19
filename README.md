# BSP layer for updating Raspberry Pi with OSTree

OSTree bootloader integration for Raspberry Pi. Add it to BBLAYERS when using [meta-updater](https://github.com/advancedtelematic/meta-updater) with [Raspberry Pi](https://github.com/agherzan/meta-raspberrypi).

For more documentation on using this layer and [HERE OTA Connect](https://connect.ota.here.com/), please see the [OTA Connect documentation portal](https://docs.ota.here.com/), in particular the guide on [building a Raspberry Pi image](https://docs.ota.here.com/ota-client/latest/build-raspberry.html).

## Device tree configuration

The Raspberry Pi firmware allows customization of the device tree with special entries in `/boot/config.txt`:
<https://www.raspberrypi.org/documentation/configuration/device-tree.md>.

This is not supported in this form when using meta-updater, as the device tree and eventual overlays are managed separately via u-boot and ostree.

Thus, you will have to make the necessary changes directly in yocto and either:

- patch the kernel sources to modify source dts
- patch the kernel sources to add overlay sources and add the corresponding binaries in `KERNEL_DEVICETREE`
- use a customized complete dtb and declare it with `EXTERNAL_KERNEL_DEVICETREE`

You can see examples of the first two approaches in [the linux-raspberrypi bbappend](recipes-kernel/linux/linux-raspberrypi_%.bbappend).

## Wi-Fi enablement for Raspberry Pi

| Name | Default | Description |
|---|---|---|
| RPI_WIFI_ENABLE | "0" | A flag to enable ("1") or disable "0" WiFi support (drivers and configuration). |
| RPI_WIFI_SSID | N/A| ID of a wireless network to connect to. Be aware this is case sensitive! Mandatory if RPI_WIFI_ENABLE is "1". |
| RPI_WIFI_PWD | N/A |  Password for a connection to a wireless network. |

## License

This code is licensed under the [Mozilla Public License 2.0](LICENSE), a copy of which can be found in this repository. All code is copyright HERE Europe B.V., 2016-2019.

We require that contributors accept the terms of Linux Foundation's [Developer Certificate of Origin](https://developercertificate.org/). Please see the [contribution instructions of aktualizr](https://github.com/advancedtelematic/aktualizr/blob/master/CONTRIBUTING.md) for more information.
