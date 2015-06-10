## For cloudbiolinux
## Upgrade this first due to config file conflict
apt-get -o Dpkg::Options::="--force-confnew" install -y cloud-init
apt-get remove -y python-fabric
apt-get clean all
pip install fabric
git clone git://github.com/kdaily/cloudbiolinux.git

cd cloudbiolinux
git checkout ngspipelineminimal_no_r

fab -f fabfile.py -H localhost install_biolinux:flavor=ngs_pipeline_minimal_nor
cd -
