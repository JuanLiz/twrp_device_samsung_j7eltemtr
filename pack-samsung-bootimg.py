#!/usr/bin/env python3
"""Pack a Samsung Exynos boot/recovery image: Android header v0 + DTBH 'dt' section + SEANDROIDENFORCE footer.
usage: pack-samsung-bootimg.py Image ramdisk.gz dt.img out.img [cmdline] [name] [ref.img]
(ref.img: image whose os_version/patch-level field is copied, e.g. the Lineage recovery.img)
Layout matches the stock SM-J700T1 and LineageOS j7eltemtr images:
base 0x10000000 (kernel +0x8000, ramdisk +0x1000000, tags +0x100), pagesize 2048."""

import hashlib
import struct
import sys

if len(sys.argv) < 5:
    sys.exit(__doc__)
k, r, d = (open(p, "rb").read() for p in sys.argv[1:4])
out = sys.argv[4]
cmdline = (sys.argv[5] if len(sys.argv) > 5 else "buildvariant=eng").encode()[:512]
name = (sys.argv[6] if len(sys.argv) > 6 else "").encode()[:16]
os_version = (
    struct.unpack("<I", open(sys.argv[7], "rb").read(48)[44:48])[0]
    if len(sys.argv) > 7
    else 0
)
ps = 2048
pad = lambda b: b + b"\0" * ((-len(b)) % ps)
hdr = struct.pack(
    "<8sIIIIIIIIII",
    b"ANDROID!",
    len(k),
    0x10008000,
    len(r),
    0x11000000,
    0,
    0,
    0x10000100,
    ps,
    len(d),
    os_version,
)
sha = hashlib.sha1()
for blob in (
    k,
    r,
    b"",
    d,
):  # same id as mkbootimg: data + size for kernel, ramdisk, second, dt
    sha.update(blob)
    sha.update(struct.pack("<I", len(blob)))
hdr += (
    name.ljust(16, b"\0")
    + cmdline.ljust(512, b"\0")
    + sha.digest().ljust(32, b"\0")
    + b"\0" * 1024
)
img = pad(hdr) + pad(k) + pad(r) + pad(d) + b"SEANDROIDENFORCE"
open(out, "wb").write(img)
print(f"{out}: kernel={len(k)} ramdisk={len(r)} dt={len(d)} total={len(img)}")
