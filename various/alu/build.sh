#!/bin/bash

repo_path=$1
app=$2

y_path=${repo_path}/y
y_build_path=${y_path}/build

app_path=${y_build_path}/${app}

cd ${app_path} || exit -1

make IVY=ivy BUILDROOT_DEFCONFIG=isam-reborn-cavium-srntd_defconfig  BUILDROOT_SKIP_DEPS=1

