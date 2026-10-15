# TWRP device tree for Samsung Galaxy J7 2015 T-Mobile / MetroPCS (j7eltemtr)

TWRP for the SM-J700T and SM-J700T1 (Exynos 7580), based on the `twrp-11` minimal manifest.
The kernel `Image` and Samsung DTBH blob (`dt.img`) in `prebuilt/` come from the LineageOS j7eltemtr build.

Derived from `NotNoelChannel/twrp_device_samsung_j7elte-1` and TeamWin's `exynos7580-common`.

## Build

`system/core` carries LineageOS' legacy FunctionFS support for adbd (`patches/`), required by this kernel.
`system/tools/mkbootimg` is LineageOS' fork, which adds the `--dt` option used by `mkbootimg.mk`.

`.repo/local_manifests/j7eltemtr.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remove-project name="android_system_core" />
  <project path="system/core" name="JuanLiz/twrp_android_system_core"
           remote="github" revision="android-11" />
  <remove-project name="platform/system/tools/mkbootimg" />
  <project path="system/tools/mkbootimg" name="LineageOS/android_system_tools_mkbootimg"
           remote="github" revision="lineage-18.1" />
  <project path="device/samsung/j7eltemtr" name="JuanLiz/twrp_device_samsung_j7eltemtr"
           remote="github" revision="android-11" />
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
`SEANDROIDENFORCE` footer). Flash it with Odin (tar) or from TWRP (Install Image, Recovery).
