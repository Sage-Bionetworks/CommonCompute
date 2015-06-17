# Provisioner for software

mkdir /root/src/
cd /root/src/

apt-get update

# Git
apt-get install -y git
apt-get install -y gcc

# modules
apt-get install -y tcl8.5-dev

# modules complains if it can't find tclsh
ln -s /usr/bin/tclsh8.5 /usr/bin/tclsh

wget "http://downloads.sourceforge.net/project/modules/Modules/modules-3.2.10/modules-3.2.10.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fmodules%2Ffiles%2F&ts=1433366084&use_mirror=iweb" -O modules-3.2.10.tar.gz
tar xvzf modules-3.2.10.tar.gz
cd modules-3.2.10/
./configure && make && make install
cd -

## For Sailfish
# This needs the module file at modulefiles/Sailfish/0.6.3
cd /opt/
wget "https://github.com/kingsfordgroup/sailfish/releases/download/v0.6.3/Sailfish-0.6.3-Linux_x86-64.tar.gz" -O Sailfish-0.6.3-Linux_x86-64.tar.gz
tar -xvzf Sailfish-0.6.3-Linux_x86-64.tar.gz
cd -
