#!/bin/bash
# *****************************************************************
# (C) Copyright IBM Corp. 2019, 2021. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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
