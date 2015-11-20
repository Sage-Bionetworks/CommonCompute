pip install fabric pyyaml
git clone git://github.com/chapmanb/cloudbiolinux.git

cd cloudbiolinux

# Required for rgl/BubbleTree
yum install mesa-libGL-devel mesa-libGLU-devel

fab -f fabfile.py -H localhost install_biolinux:flavor=ngs_pipeline_minimal
cd -
