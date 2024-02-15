FROM oraclelinux:7

COPY rpmmacros /root/.rpmmacros

RUN yum -y install wget rpm-build gcc gcc-c++ make yum-utils
COPY shim-15.8-2.0.3.el7.src.rpm /
RUN rpm -ivh shim-15.8-2.0.3.el7.src.rpm
RUN yum-builddep -y --enablerepo=ol7_optional_latest /builddir/build/SPECS/shim.spec
RUN rpmbuild -bb /builddir/build/SPECS/shim.spec
COPY shimx64.efi /
RUN ls -l /
RUN ls -l /builddir/build/RPMS/x86_64
RUN rpm2cpio /builddir/build/RPMS/x86_64/shim-unsigned-x64-15.8-2.0.3.el7.x86_64.rpm | cpio -idmv
RUN hexdump -Cv /usr/share/shim/x64-15.8-2.0.3.el7/shimx64.efi > built-x64.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN sha256sum /usr/share/shim/x64-15.8-2.0.3.el7/shimx64.efi /shimx64.efi
RUN diff -u orig-x64.hex built-x64.hex
RUN objdump -h /usr/share/shim/x64-15.8-2.0.3.el7/shimx64.efi
