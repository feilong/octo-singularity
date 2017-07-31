# source this script to start singularity

if [[ `hostname` == ndoli* ]]; then
    module load singularity/2.3.1
else
    module load singularity
fi

unset PYTHONPATH

# Mount home directory with non-standard location
# https://groups.google.com/a/lbl.gov/forum/#!topic/singularity/BvV4Lf0JEgY

# Mount scratch in the future if mount points exist
#     -B /global/scratch/fma:/scratch \
#     -B /scratch/fma:/local-scratch \

env -i `which singularity` exec \
    -B /idata/DBIC/fma:/mnt \
    -H /idata/DBIC/fma/linuxbrew-singularity/home:/home/fma \
    /idata/DBIC/fma/id-studies.img \
    /bin/bash
