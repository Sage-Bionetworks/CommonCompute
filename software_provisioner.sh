# Provisioner for software

# modules
apt-get install -y tcl8.5-dev
mkdir /root/src
cd /root/src
wget "http://downloads.sourceforge.net/project/modules/Modules/modules-3.2.10/modules-3.2.10.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fmodules%2Ffiles%2F&ts=1433366084&use_mirror=iweb" -O modules-3.2.10.tar.gz
tar xvzf modules-3.2.10.tar.gz
cd modules-3.2.10/
./configure && make && make install
cd -
