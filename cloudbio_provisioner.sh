pip install fabric pyyaml
git clone git://github.com/kdaily/cloudbiolinux.git

cd cloudbiolinux
git checkout forami

fab -f fabfile.py -H localhost install_biolinux:flavor=ngs_pipeline_minimal
cd -
