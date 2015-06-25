## For cloudbiolinux
yum install -y cloud-init

pip2.7 install fabric pyyaml
git clone git://github.com/chapmanb/cloudbiolinux.git

cd cloudbiolinux

fab -f fabfile.py -H localhost install_biolinux:flavor=ngs_pipeline_minimal
cd -
