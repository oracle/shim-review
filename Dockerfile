FROM oraclelinux:7.9

RUN yum -y install wget rpm-build gcc gcc-c++ make yum-utils
RUN wget https://oss.oracle.com/ol7/shim/shim-15.7-1.0.1.el7/shim-15.7-1.0.1.el7.src.rpm
#COPY shim-15.7-1.0.1.el7.src.rpm /
RUN rpm -ivh shim-15.7-1.0.1.el7.src.rpm
RUN yum-builddep -y --enablerepo=ol7_optional_latest /root/rpmbuild/SPECS/shim.spec
RUN yum -y update
RUN rpmbuild -bb /root/rpmbuild/SPECS/shim.spec
COPY shimia32.efi /
COPY shimx64.efi /
RUN ls -l /
RUN ls -l /root/rpmbuild/RPMS/x86_64
RUN rpm2cpio /root/rpmbuild/RPMS/x86_64/shim-unsigned-ia32-15.7-1.0.1.el7.x86_64.rpm  | cpio -idmv
RUN rpm2cpio /root/rpmbuild/RPMS/x86_64/shim-unsigned-x64-15.7-1.0.1.el7.x86_64.rpm | cpio -idmv
RUN hexdump -Cv ./usr/share/shim/15.7-1.0.1.el7/x64/shimx64.efi > built-x64.hex
RUN hexdump -Cv ./usr/share/shim/15.7-1.0.1.el7/ia32/shimia32.efi > built-x32.hex
RUN hexdump -Cv /shimia32.efi > orig-x32.hex
RUN hexdump -Cv /shimx64.efi > orig-x64.hex
RUN sha256sum /usr/share/shim/15.7-1.0.1.el7/x64/shimx64.efi /shimx64.efi
RUN sha256sum /usr/share/shim/15.7-1.0.1.el7/ia32/shimia32.efi /shimia32.efi
RUN diff -u orig-x32.hex built-x32.hex
RUN diff -u orig-x64.hex built-x64.hex
RUN objdump -h /usr/share/shim/15.7-1.0.1.el7/x64/shimx64.efi
RUN objdump -h /usr/share/shim/15.7-1.0.1.el7/ia32/shimia32.efi

