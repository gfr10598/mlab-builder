FROM tenforward/centos-i386

RUN linux32 yum -y update
RUN linux32 yum install -y wget git svn
RUN linux32 yum install -y binutils qt gcc make patch libgomp
RUN linux32 yum install -y glibc-headers glibc-devel kernel-headers kernel-devel htop dkms
RUN linux32 yum install -y rpm-builder rpm-build m4 python-devel openssl-devel
RUN linux32 rpm -ivh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN linux32 yum install -y --nogpgcheck jansson-devel
RUN linux32 yum install -y nodejs npm --enablerepo=epel

# You'll want to run this docker with -ti, otherwise it just exits.
ENTRYPOINT linux32
