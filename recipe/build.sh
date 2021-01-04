# *****************************************************************
#
# Licensed Materials - Property of IBM
#
# (C) Copyright IBM Corp. 2019, 2020. All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# *****************************************************************
set -ex

FORCE_CUDA=0
if [ $build_type == "cuda" ]
then
    export FORCE_CUDA=1

    # Create symlinks of cublas headers into CONDA_PREFIX
    mkdir -p $CONDA_PREFIX/include
    find /usr/include -name cublas*.h -exec ln -s "{}" "$CONDA_PREFIX/include/" ';'
    export CUDA_INCLUDE_PATH="${PREFIX}/include,${CUDA_HOME}/include,${CONDA_PREFIX}/include"
fi

export BUILD_VERSION=${PKG_VERSION}
export TORCHVISION_INCLUDE=${PREFIX}/include
export TORCHVISION_LIBRARY=${PREFIX}/lib
python setup.py install --single-version-externally-managed --record=record.txt
