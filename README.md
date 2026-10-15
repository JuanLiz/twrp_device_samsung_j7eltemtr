# TWRP device tree for Samsung Galaxy J7 2015 T-Mobile / MetroPCS (j7eltemtr)

The Samsung Galaxy J7 2015 for T-Mobile (SM-J700T) and MetroPCS (SM-J700T1) is a mid-range
smartphone from Samsung released in 2015.

<img width="720" height="720" alt="image" src="https://github.com/user-attachments/assets/d587c933-0616-452f-a004-f61ab4cb8b8b" />

## Device specifications

| Feature                 | Specification                                                      |
| :---------------------- | :----------------------------------------------------------------- |
| Chipset                 | Samsung Exynos 7580 (28 nm)                                        |
| CPU                     | Octa-core 1.5 GHz Cortex-A53                                       |
| GPU                     | Mali-T720MP2                                                       |
| Memory                  | 1.5 GB                                                             |
| Shipped Android version | 5.1.1, last official 7.1.1                                         |
| Storage                 | 16 GB eMMC, microSD                                                |
| Battery                 | Li-Ion 3000 mAh, removable                                         |
| Display                 | 5.5", 720 x 1280, Super AMOLED                                     |
| Rear camera             | 13 MP, f/1.9, autofocus, LED flash                                 |
| Front camera            | 5 MP, f/2.2, LED flash                                             |
| Connectivity            | Wi-Fi 802.11 b/g/n, Bluetooth 4.1, NFC, GPS                        |
| Sensors                 | Accelerometer, proximity, grip                                     |
| Kernel                  | Linux 3.10                                                         |

## Build

Based on the TWRP `twrp-11` minimal manifest (TWRP 3.7.0_11-0). The kernel `Image` and the Samsung DTBH
blob (`dt.img`) in `prebuilt/` come from the
[LineageOS 18.1 build](https://github.com/JuanLiz/android_device_samsung_j7eltemtr) for this device.

Two projects of the manifest are replaced: `system/core`, which carries LineageOS' legacy FunctionFS
support for adbd (`patches/`), required by this kernel; and `system/tools/mkbootimg`, LineageOS' fork
with the `--dt` option used by `mkbootimg.mk`.

`.repo/local_manifests/j7eltemtr.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remove-project name="android_system_core" />
  <project path="system/core" name="JuanLiz/twrp_android_system_core" remote="github" revision="android-11" />
  <remove-project name="platform/system/tools/mkbootimg" />
  <project path="system/tools/mkbootimg" name="LineageOS/android_system_tools_mkbootimg" remote="github" revision="lineage-18.1" />
  <project path="device/samsung/j7eltemtr" name="JuanLiz/twrp_device_samsung_j7eltemtr" remote="github" revision="android-11" />
</manifest>
```

```
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
repo sync
. build/envsetup.sh
lunch twrp_j7eltemtr-eng
mka recoveryimage
```

`out/target/product/j7eltemtr/recovery.img` is a Samsung boot image (lzma ramdisk, DT section,
`SEANDROIDENFORCE` footer), ready to flash with Odin (inside a `tar`) or from TWRP (Install Image, Recovery).

## Copyright

  Copyright © 2026 JuanLiz. Derived from
  [NotNoelChannel/twrp_device_samsung_j7elte-1](https://github.com/NotNoelChannel/twrp_device_samsung_j7elte-1)
  and [TeamWin/android_device_samsung_exynos7580-common](https://github.com/TeamWin/android_device_samsung_exynos7580-common).

  Licensed under the Apache License, Version 2.0; see [LICENSE](LICENSE).
