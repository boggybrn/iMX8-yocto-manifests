#!/bin/bash
mkdir -p yocto
cd yocto
repo init -u https://github.com/boggybrn/iMX8-yocto-manifests -b main -m default.xml
repo sync

MACHINE=imx8mpsolidrun
DISTRO=fsl-imx-xwayland

MACHINE=$MACHINE DISTRO=$DISTRO source imx-setup-release.sh

cat ../sources/meta-boggybrn/conf/template-default/local.conf.sample >> conf/local.conf


