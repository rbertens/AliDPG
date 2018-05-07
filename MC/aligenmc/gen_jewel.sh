#!/bin/bash
set -e

if [[ $# -lt 4 ]]; then
    echo "Not enough arguments passed"
    exit -1
fi

#sanity check
echo "running in `pwd`, writing HepMC to $4"
echo "  - generator: $3 "
echo "  - nevents: $2 "
echo "  - energy: $1 "

# prepare environment
source /cvmfs/alice.cern.ch/etc/login.sh
eval $(alienv printenv AliGenerators::v20180424-1)
eval $(alienv printenv VO_ALICE@aligenmc::v0.0.2_STAGING_PWGMM-1)
# run generator

aligenmc $1 $2 $3 $4
