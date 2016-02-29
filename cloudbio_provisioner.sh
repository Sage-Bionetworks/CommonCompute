<<<<<<< HEAD
cd /home/centos/src
git clone git://github.com/chapmanb/cloudbiolinux.git

cd cloudbiolinux

# Required for rgl/BubbleTree
yum install -y mesa-libGL-devel mesa-libGLU-devel

module load python/3.5.1
fab -f fabfile.py -H localhost install_biolinux:flavor=ngs_pipeline_minimal
cd -

=======
#!/bin/bash -x

cd /root/src

wget https://raw.github.com/chapmanb/bcbio-nextgen/master/scripts/bcbio_nextgen_install.py

python bcbio_nextgen_install.py /opt/bcbio --tooldir=/opt/bcbio --isolate --nodata --aligners bwa --aligners bowtie2 --aligners bowtie --distribution centos --aligners star --aligners novoalign
>>>>>>> kdaily/test
