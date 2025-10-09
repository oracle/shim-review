FROM oraclelinux:10

RUN yum -y install wget rpm-build gcc gcc-c++ make yum-utils


# Install OL10.1 version of gcc to get reproducible shim build
COPY gcc_14.3.1-2.1_x86_64/ /gcc_14.3.1-2.1
RUN dnf update /gcc_14.3.1-2.1/*.rpm

COPY shim-unsigned-x64-16.1-1.0.2.el10.src.rpm /
RUN rpm -ivh shim-unsigned-x64-16.1-1.0.2.el10.src.rpm 
RUN yum-builddep -y --enablerepo=ol10_appstream,ol10_baseos_latest /root/rpmbuild/SPECS/shim-unsigned-x64.spec
RUN rpmbuild -bb /root/rpmbuild/SPECS/shim-unsigned-x64.spec
COPY shimx64.efi /
RUN ls -l /
RUN ls -l /root/rpmbuild/RPMS/x86_64
RUN rpm2cpio /root/rpmbuild/RPMS/x86_64/shim-unsigned-x64-16.1-1.0.2.el10.x86_64.rpm | cpio -idmv
RUN hexdump -Cv ./usr/share/shim/16.1-1.0.2.el10/x64/shimx64.efi > built-x64.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN sha256sum /usr/share/shim/16.1-1.0.2.el10/x64/shimx64.efi /shimx64.efi
RUN diff -u orig-x64.hex built-x64.hex
RUN objdump -h /usr/share/shim/16.1-1.0.2.el10/x64/shimx64.efi

