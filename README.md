This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag
- approval is ready when the "accepted" label is added to your issue

Note that we really only have experience with using GRUB2 or systemd-boot on Linux, so
asking us to endorse anything else for signing is going to require some convincing on
your part.

Check the docs directory in this repo for guidance on submission and
getting your shim signed.

Here's the template:

*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
Oracle Corporation

*******************************************************************************
### What product or service is this for?
*******************************************************************************
Oracle Linux https://www.oracle.com/linux/index.html

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
Oracle Linux is a popular enterprise Linux distribution with Secure Boot support.

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
Oracle Linux is a big OS vendor with custom GRUB2 patches and support program.

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Ilya Okomin
- Position: Oracle Linux Software Development Manager, Security Assurance
- Email address: ilya.okomin@oracle.com
- PGP key fingerprint: AC2E 0425 F0E5 0625 F0EE  8376 CC4F 721D 5B96 2F83

https://github.com/oracle/shim-review/raw/main/iokomin.pub

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: John Haxby
- Position: Oracle Linux Software Architect, Kernel and Security
- Email address: john.haxby@oracle.com
- PGP key fingerprint: FEA7 1BDB D750 8559 490D  48E5 450B BB7E 942F A3C8

https://github.com/oracle/shim-review/raw/main/jhaxby.pub

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Were these binaries created from the 15.8 shim release tar?
Please create your shim binaries starting with the 15.8 shim release tar file: https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.8 and contains the appropriate gnu-efi source.

*******************************************************************************
Yes

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
Source rpm provided in this review tag/branch:
shim-unsigned-x64-15.8-1.0.3.el9.src.rpm
shim-unsigned-aarch64-15.8-1.0.2.el9.src.rpm

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
NA

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************
NX bit is not set

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
Downstream RHEL/Fedora/Debian/Canonical like implementation

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of GRUB2 affected by any of the CVEs in the July 2020, the March 2021, the June 7th 2022, the November 15th 2022, or 3rd of October 2023 GRUB2 CVE list, have fixes for all these CVEs been applied?

* 2020 July - BootHole
  * Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
  * CVE-2020-10713
  * CVE-2020-14308
  * CVE-2020-14309
  * CVE-2020-14310
  * CVE-2020-14311
  * CVE-2020-15705
  * CVE-2020-15706
  * CVE-2020-15707
* March 2021
  * Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
  * CVE-2020-14372
  * CVE-2020-25632
  * CVE-2020-25647
  * CVE-2020-27749
  * CVE-2020-27779
  * CVE-2021-3418 (if you are shipping the shim_lock module)
  * CVE-2021-20225
  * CVE-2021-20233
* June 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
  * CVE-2021-3695
  * CVE-2021-3696
  * CVE-2021-3697
  * CVE-2022-28733
  * CVE-2022-28734
  * CVE-2022-28735
  * CVE-2022-28736
  * CVE-2022-28737
* November 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
  * CVE-2022-2601
  * CVE-2022-3775
* October 2023 - NTFS vulnerabilities
  * Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
  * CVE-2023-4693
  * CVE-2023-4692
*******************************************************************************
The signed bootloaders are derived from GRUB2 2.06 with all of the relevant patches except CVE-2023-4692 and CVE-2023-4693, as we are not including NTFS modules into Oracle signed grub EFI images.

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
The entry should look similar to: `grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`
*******************************************************************************
No, it’s grub,3.
Because we are not building NTFS modules ( which are affected by last CVE ) into Oracle signed grub EFI binary.

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
Yes

Pre-SBAT shims revoked in dbx update

Oracle uses vendor_db with EV certificates. Pre-SBAT affected GRUB2 signing cert removed from shim, new signing EV certificate introduced in shim vendor_db.
GRUB2 builds with CVE fixes signed with the new signing EV certificate.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
All Oracle kernels signed for SecureBoot have patches above applied.

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
Oracle Linux actively backports features and bugfixes.

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
Yes, build time generated ephemeral key.

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
3 EV certificates enrolled in vendor_db:
- EV cert to sign shim MokManager, fallback binaries and fwupd
- EV cert to sign grub2
- EV cert to sign kernel

vendor_db on aarch64 has different certificate from x86_64 distribution.
vendor_db ESL files as well as X509 certificates provided in the review branch/tag

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
Not applicable

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************
Dockerfile files to reproduce build is included. Oracle Linux images are available on docker hub and container-registry.oracle.com.
x86_64: Dockerfile
aarch64: Dockerfile_aarch64

```
$ podman build --security-opt=seccomp=unconfined -t ol9_shim15.8:shim-review .
```

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
.log files

*******************************************************************************
### What changes were made in the distor's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..
*******************************************************************************
Last signed Oracle SHIM is 15.7 based, this update rebased against 15.8, no other changes.


*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
```
29aa4c77f237df563941029c2b49d9d75509bc4da3d516c0181b0f1f3400e789  shimaa64.efi
26ddbfb224c1a09368b4e2472de6707a26c3ce26aa00f783620e8fb0b98eec67  shimx64.efi
```

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
EV Certificates with private keys stored in HSM

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
Yes

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
If you are using a downstream implementation of GRUB2 or systemd-boot (e.g.
from Fedora or Debian), please preserve the SBAT entry from those distributions
and only append your own. More information on how SBAT works can be found
[here](https://github.com/rhboot/shim/blob/main/SBAT.md).
*******************************************************************************
shim:

```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.ol,3,UEFI shim,shim,15.8,mail:secalert_us@oracle.com
```


grub2:

```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,3,Free Software Foundation,grub,2.02,https://www.gnu.org/software/grub/
grub.ol9,3,Oracle Linux,grub2,@@Version@@,mail:secalert_us@oracle.com
```

fwupd:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupd-efi,1,Firmware update daemon,fwupd-efi,1.3,https://github.com/fwupd/fwupd-efi
fwupd-efi.ol,1,Oracle Linux,fwupd,1.7.8,mail:secalert_us@oracle.com
```

*******************************************************************************
### If shim is loading GRUB2 bootloader, which modules are built into your signed GRUB2 image?
*******************************************************************************
efi_netfs efifwsetup efinet lsefi
lsefimmap connectefi backtrace chain
usb usbserial_common usbserial_pl2303
usbserial_ftdi usbserial_usbdebug keylayouts
at_keyboard
all_video boot blscfg btrfs
cat configfile cryptodisk echo ext2
fat font gcry_rijndael gcry_rsa gcry_serpent
gcry_sha256 gcry_twofish gcry_whirlpool
gfxmenu gfxterm gzio halt hfsplus http
increment iso9660 jpeg loadenv loopback linux
lvm luks mdraid09 mdraid1x minicmd multiboot2 net
normal part_apple part_msdos part_gpt
password_pbkdf2 png reboot regexp search
search_fs_uuid search_fs_file search_label
serial sleep syslinuxcfg test tftp video xfs

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************
No, Oracle Linux does not use systemd-boot.

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or systemd-boot or other)?
*******************************************************************************
GRUB2 2.06-70.0.2.el9 based on latest available in public RHEL GRUB2 + Oracle customization patches on top

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
shim also launches fwupd

*******************************************************************************
### If your GRUB2 or systemd-boot launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
No

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
GRUB2 verifies signatures on booted kernels via shim, all the other expected components are both verified by secureboot signatures and SBAT verification

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB2)?
*******************************************************************************
No

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
- 5.14.0 based kernel with lockdown patches
- 5.15.0 based kernel with lockdown patches

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
No
