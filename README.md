This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------

Oracle Corporation

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------

Oracle Linux https://www.oracle.com/linux/index.html

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------

Oracle Linux is a popular enterprise Linux distribution with Secure Boot support.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------

- Name: Ilya Okomin
- Position: Security Team Principal Engineer
- Email address: ilya.okomin@oracle.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community:
 
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2
 
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
=z0wv
-----END PGP PUBLIC KEY BLOCK-----


-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------

- Name: John Haxby
- Position: Security Team Consulting Engineer
- Email address: john.haxby@oracle.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community:
 
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2
 
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
2MOK6A==
=b0eH
-----END PGP PUBLIC KEY BLOCK-----

-------------------------------------------------------------------------------
Please create your shim binaries starting with the 15.3 shim release tar file:
https://github.com/rhboot/shim/releases/download/15.3/shim-15.3.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.3 and contains
the appropriate gnu-efi source.
-------------------------------------------------------------------------------

Confirmed

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------

https://oss.oracle.com/ol8/shim/shim-15.3-1.0.1.el8/shim-unsigned-x64-15.3-1.0.1.el8.src.rpm


-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------

Patch0001: 0001-Check-if-r-flag-is-supported-for-dos2unix.patch
	- Check if -r flag is supported for dos2unix

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632,
 CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233,
 CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311,
 CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------

Yes

-------------------------------------------------------------------------------
What exact implementation of Secureboot in GRUB2 ( if this is your bootloader ) you have ?
 Upstream grub2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
-------------------------------------------------------------------------------

Downstream RHEL/Fedora/Debian/Canonical like implementation


-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2, and previous shims were trusting affected
by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?
-------------------------------------------------------------------------------

Were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?

Answer: Yes

Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?

Answer: Affected grub2 signing cert removed from shim, new signing EV certificate introduced.
New grub2 builds with CVE fix will be signed with new signing EV certificate.

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------

Oracle signs only kernels with applied ACPI and efi patches.


-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are allow-listed hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------

4 certificates enrolled in vendor_db:
- EV cert to sign shim MokManager, fallback binaries and fwupd
- EV cert to sign grub2
- 2 EV certs to sign kernel

--------------------------------------------------------------------------------
If you are re-using a previously used (CA) certificate, you will need
to add the hashes of the previous GRUB2 binaries to vendor_dbx in shim
in order to prevent GRUB2 from being able to chainload those older GRUB2
binaries. If you are changing to a new (CA) certificate, this does not
apply. Please describe your strategy.
--------------------------------------------------------------------------------

Not applicable

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.
We're going to try to reproduce your build as close as possible to verify that it's really
a build of the source tree you tell us it is, so these need to be fairly thorough.
At the very least include the specific versions of gcc, binutils, and gnu-efi which were used,
and where to find those binaries.
If possible, provide a Dockerfile that rebuilds the shim.
-------------------------------------------------------------------------------

Dockerfile to reproduce build is included.
Oracle Linux images are available on docker hub.

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build,
creating the archives, etc.
-------------------------------------------------------------------------------

build.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
[your text here]
