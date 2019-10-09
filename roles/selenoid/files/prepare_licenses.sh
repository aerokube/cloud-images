#!/bin/bash

set -e

dir=$1

gp=$(realpath ${dir}/go)
lc=$(realpath ${dir}/licenses)
mkdir -p ${dir}
GOPATH=${gp} go clean --modcache
rm -Rf ${dir}/selenoid
git clone https://github.com/aerokube/selenoid.git ${dir}/selenoid
pushd ${dir}/selenoid && GOPATH=${gp} go get && popd
rm -Rf ${dir}/selenoid-ui
git clone https://github.com/aerokube/selenoid-ui.git ${dir}/selenoid-ui
pushd ${dir}/selenoid-ui && GOPATH=${gp} go get && popd
rm -Rf ${dir}/cm
git clone https://github.com/aerokube/cm.git ${dir}/cm
pushd ${dir}/cm && GOPATH=${gp} go get && popd
mkdir -p ${lc}
if [ -n $(command -v rsync) -a -n $(command -v realpath) ]; then
    pushd ${gp}/pkg/mod && rsync -Rrm --include='LICENSE*' --include='*/' --exclude='*' . ${lc} && popd
else
    find ${gp} -name 'LICENSE*' -exec cp --parents \{\} ${lc} \;
fi
