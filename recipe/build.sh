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
fi

python setup.py install --single-version-externally-managed --record=record.txt
