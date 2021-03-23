Make sure you have provided the following information:

 - [ ] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 - [ ] completed README.md file with the necessary information
 - [ ] shim.efi to be signed
 - [ ] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [ ] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [ ] any extra patches to shim via your own git tree or as files
 - [ ] any extra patches to grub via your own git tree or as files
 - [ ] build logs


###### What organization or people are asking to have this signed:
Oracle Corporation

###### What product or service is this for:
Oracle Linux
https://www.oracle.com/linux/index.html

###### Please create your shim binaries starting with the 15.3 shim release tar file:
###### https://github.com/rhboot/shim/releases/download/15.3/shim-15.3.tar.bz2
###### This matches https://github.com/rhboot/shim/releases/tag/15.3 and contains
###### the appropriate gnu-efi source.
###### Please confirm this as the origin your shim.
Upstream shim version 15.3
https://github.com/rhboot/shim/tree/shim-15.3

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
Oracle Linux is a popular enterprise Linux distribution with Secure Boot support.

###### How do you manage and protect the keys used in your SHIM?
Digicert SSM service hardware protected EV certificates

###### Do you use EV certificates as embedded certificates in the SHIM?
Yes

###### If you use new vendor_db functionality, are any hashes allow-listed, and if yes: for what binaries ?
No hashes whitelisted

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a Linux kernel ?
Yes

###### if SHIM is loading GRUB2 bootloader, are CVEs CVE-2020-14372,
###### CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779,
###### CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308,
###### CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
###### ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
###### and if you are shipping the shim_lock module CVE-2021-3418
###### fixed ?
Yes

###### "Please specifically confirm that you add a vendor specific SBAT entry for SBAT header in each binary that supports SBAT metadata
###### ( grub2, fwupd, fwupdate, shim + all child shim binaries )" to shim review doc ?
###### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim
We keep all upstream SBAT entries and also append Oracle specific.
Since most packages in Oracle Linux are based on RHEL we also keep RHEL specific entries.

Oracle specific additions to packages are

grub2 Oracle Linux 7:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,1,Free Software Foundation,grub,2.02,https://www.gnu.org/software/grub/
grub.rhel7,1,Red Hat Enterprise Linux 7,grub2,@@VERSION@@,mail:secalert@redhat.com
grub.ol7,1,Oracle Linux 7,grub2,@@VERSION@@,mail:secalert_us@oracle.com

grub2 Oracle Linux 8:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,1,Free Software Foundation,grub,2.02,https://www.gnu.org/software/grub/
grub.rhel8,1,Red Hat Enterprise Linux 8,grub2,@@VERSION@@,mail:secalert@redhat.com
grub.ol8,1,Oracle Linux 8,grub2,@@VERSION@@,mail:secalert_us@oracle.com

shim Oracle Linux 7:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,1,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.ol7,1,UEFI shim,shim,1,https://github.com/rhboot/shim

shim Oracle Linux 8:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,1,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.ol8,1,UEFI shim,shim,1,https://github.com/rhboot/shim

All new UEFI binaries that are yet to be built with SBAT support will follow agreed SBAT variable pattern and we will add Oracle specific entry for them.

##### Were your old SHIM hashes provided to Microsoft ?
Yes

##### Did you change your certificate strategy, so that affected by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
##### CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
##### CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705 ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
##### grub2 bootloaders can not be verified ?
Affected grub2 signing cert removed from shim, new signing EV certificate introduced.
New grub2 builds with CVE fix will be signed with new signing EV certificate.

##### What exact implementation of Secureboot in grub2 ( if this is your bootloader ) you have ?
##### * Upstream grub2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
Downstream RHEL/Fedora/Debian/Canonical like implementation

###### What is the origin and full version number of your bootloader (GRUB or other)?
grub2 v2.02-90.0.2.el8 - upstream plus number of patches from RedHat and Oracle

###### If your SHIM launches any other components, please provide further details on what is launched
No

###### If your GRUB2 launches any other binaries that are not Linux kernel in SecureBoot mode,
###### please provide further details on what is launched and how it enforces Secureboot lockdown
grub2 launches Linux kernel

###### How do the launched components prevent execution of unauthenticated code?
grub2 verifies signatures on booted kernels via shim

###### If you are re-using a previously used (CA) certificate, you
###### will need to add the hashes of the previous GRUB2 binaries
###### exposed to the CVEs to vendor_dbx in shim in order to prevent
###### GRUB2 from being able to chainload those older GRUB2 binaries. If
###### you are changing to a new (CA) certificate, this does not
###### apply. Please describe your strategy.
Not applicable, grub2 leaf certificate rotated in Oracle Linux shim

###### How do the launched components prevent execution of unauthenticated code?
Oracle Linux has same UEFI verification shim framework as RHEL that verifies all launched UEFI binaries.
All modules built into the GRUB2 either use shim framework or disabled when secureboot is enabled.

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
No

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
4.18 based kernel with lockdown patches
5.4 based kernel with lockdown patches
5.8 based kernel with lockdown patches

###### What changes were made since your SHIM was last signed?
Shim rebased to upstream version shim-15.3

###### What is the SHA256 hash of your final SHIM binary?
<PLACE HOLDER FOR HASH>  shimia32.efi
<PLACE HOLDER FOR HASH>  shimx64.efi
