FROM tenforward/centos-i386
LABEL vendor="measurement-lab" description="slice builder specialized for NDT"

RUN linux32 yum -y update
RUN linux32 yum install -y wget git svn
RUN linux32 yum install -y binutils qt gcc make patch libgomp
RUN linux32 yum install -y glibc-headers glibc-devel kernel-headers kernel-devel htop dkms
RUN linux32 yum install -y rpm-builder rpm-build m4 python-devel openssl-devel
RUN linux32 rpm -ivh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN linux32 yum install -y --nogpgcheck jansson-devel
RUN linux32 yum install -y nodejs npm --enablerepo=epel

ADD build_ndt.sh /root/

# You'll want to run this docker with -ti, otherwise it just exits.
# This builds NDT slice by default.  To build NDT and exit, use:
#   docker run -v `pwd`/ndt:/root/builder imagename
# On completion, the newly build NDT code will be available in the ndt subdirectory.
#
# To start a bash shell instead:
#   docker run -ti imagename bash

ENTRYPOINT ["linux32"]
CMD ["/root/build_ndt.sh"]
