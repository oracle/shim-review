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

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

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
Oracle Linux is a big OS vendor with custom grub2 patches and support program.

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
### Were these binaries created from the 15.7 shim release tar?
Please create your shim binaries starting with the 15.7 shim release tar file: https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.7 and contains the appropriate gnu-efi source.

*******************************************************************************
The shim-15.7.tar.bz2 is used as the original tarball.

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
Source rpm provided in this review tag/branch:
shim-unsigned-x64-15.7-1.0.1.el8.src.rpm
shim-unsigned-aa64-15.7-1.0.1.el8.src.rpm

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
Not applicable

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
Downstream RHEL/Fedora/Debian/Canonical like implementation

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of grub affected by any of the CVEs in the July 2020 grub2 CVE list, the March 2021 grub2 CVE list, the June 7th 2022 grub2 CVE list, or the November 15th 2022 list, have fixes for all these CVEs been applied?

* CVE-2020-14372
* CVE-2020-25632
* CVE-2020-25647
* CVE-2020-27749
* CVE-2020-27779
* CVE-2021-20225
* CVE-2021-20233
* CVE-2020-10713
* CVE-2020-14308
* CVE-2020-14309
* CVE-2020-14310
* CVE-2020-14311
* CVE-2020-15705
* CVE-2021-3418 (if you are shipping the shim_lock module)

* CVE-2021-3695
* CVE-2021-3696
* CVE-2021-3697
* CVE-2022-28733
* CVE-2022-28734
* CVE-2022-28735
* CVE-2022-28736
* CVE-2022-28737

* CVE-2022-2601
* CVE-2022-3775
*******************************************************************************
The signed bootloaders are derived from grub 2.02 with all of the relevant patches.

*******************************************************************************
### If these fixes have been applied, have you set the global SBAT generation on your GRUB binary to 3?
*******************************************************************************
Yes

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
Pre-SBAT shims revoked in dbx update

Oracle uses vendor_db with EV certificates. Pre-SBAT affected grub2 signing cert removed from shim, new signing EV certificate introduced in shim vendor_db. 
grub2 builds with CVE fixes signed with the new signing EV certificate.

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

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
.log files

*******************************************************************************
### What changes were made since your SHIM was last signed?
*******************************************************************************
Rebased against 15.7

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************

1d4b6ac96664e1208b8560070da66eb667f761f4fccb7b51c71b261f68bb1602  shimaa64.efi
64fabff11435fdbf2f9e44a289e54968a839e96cd9732ad23a7171cb25f411ba  shimia32.efi
acb60ad4122b28c78e502f6ec862932d8e319ba7680fd48a0bc261d3c4d1ad92  shimx64.efi

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
EV Certificates with private keys stored in HSM

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
Yes

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( grub2, fwupd, fwupdate, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
*******************************************************************************
shim:

```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,3,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.ol,3,UEFI shim,shim,15.7,mail:secalert_us@oracle.com
```


grub2:

```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,3,Free Software Foundation,grub,2.02,https://www.gnu.org/software/grub/
grub.ol8,3,Oracle Linux 8,grub2,@@Version@@,mail:secalert_us@oracle.com
```

fwupd:
```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
fwupd-efi,1,Firmware update daemon,fwupd-efi,1.3,https://github.com/fwupd/fwupd-efi
fwupd-efi.ol,1,Oracle Linux,fwupd,1.7.4,mail:secalert_us@oracle.com
```

*******************************************************************************
### Which modules are built into your signed grub image?
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
lvm luks mdraid09 mdraid1x minicmd net
normal part_apple part_msdos part_gpt
password_pbkdf2 png reboot regexp search
search_fs_uuid search_fs_file search_label
serial sleep syslinuxcfg test tftp video xfs


*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB or other)?
*******************************************************************************
grub2 2.02-142.0.1.el8 based on latest available in public RHEL grub2 + Oracle customization patches on top + CVE patches

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
No

*******************************************************************************
### If your GRUB2 launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
No

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
grub2 verifies signatures on booted kernels via shim

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
*******************************************************************************
No

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
- 4.18.0 based kernel with lockdown patches 
- 5.4.17 based kernel with lockdown patches 
- 5.15.0 based kernel with lockdown patches

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
No
