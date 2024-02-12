FROM oraclelinux:8

RUN yum -y install wget rpm-build gcc gcc-c++ make yum-utils
COPY shim-unsigned-x64-15.8-1.0.3.el8.src.rpm /
RUN rpm -ivh shim-unsigned-x64-15.8-1.0.3.el8.src.rpm
RUN yum-builddep -y --enablerepo=ol8_appstream,ol8_baseos_latest /root/rpmbuild/SPECS/shim-unsigned-x64.spec
RUN rpmbuild -bb /root/rpmbuild/SPECS/shim-unsigned-x64.spec
COPY shimia32.efi /
COPY shimx64.efi /
RUN ls -l /
RUN ls -l /root/rpmbuild/RPMS/x86_64
RUN rpm2cpio /root/rpmbuild/RPMS/x86_64/shim-unsigned-ia32-15.8-1.0.3.el8.x86_64.rpm  | cpio -idmv
RUN rpm2cpio /root/rpmbuild/RPMS/x86_64/shim-unsigned-x64-15.8-1.0.3.el8.x86_64.rpm | cpio -idmv
RUN hexdump -Cv ./usr/share/shim/15.8-1.0.3.el8/x64/shimx64.efi > built-x64.hex
RUN hexdump -Cv ./usr/share/shim/15.8-1.0.3.el8/ia32/shimia32.efi > built-x32.hex
RUN hexdump -Cv /shimia32.efi > orig-x32.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN sha256sum /usr/share/shim/15.8-1.0.3.el8/x64/shimx64.efi /shimx64.efi
RUN sha256sum /usr/share/shim/15.8-1.0.3.el8/ia32/shimia32.efi /shimia32.efi
RUN diff -u orig-x32.hex built-x32.hex
RUN diff -u orig-x64.hex built-x64.hex
RUN objdump -h /usr/share/shim/15.8-1.0.3.el8/x64/shimx64.efi
RUN objdump -h /usr/share/shim/15.8-1.0.3.el8/ia32/shimia32.efi

