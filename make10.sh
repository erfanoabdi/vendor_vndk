#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

# Copy phh stuffs
mkdir -p $1/lib/vndk-27
mkdir -p $1/lib64/vndk-27
cp -fprn $thispath/vndk-27-arm32/* $1/lib/vndk-27/
cp -fprn $thispath/vndk-27-arm64/* $1/lib64/vndk-27/
mkdir -p $1/lib/vndk-sp-27
mkdir -p $1/lib64/vndk-sp-27
cp -fprn $thispath/vndk-sp-27-arm32/* $1/lib/vndk-sp-27/
cp -fprn $thispath/vndk-sp-27-arm64/* $1/lib64/vndk-sp-27/

mkdir -p $1/lib/vndk-28
mkdir -p $1/lib64/vndk-28
cp -fprn $thispath/vndk-28-arm32/* $1/lib/vndk-28/
cp -fprn $thispath/vndk-28-arm64/* $1/lib64/vndk-28/
mkdir -p $1/lib/vndk-sp-28
mkdir -p $1/lib64/vndk-sp-28
cp -fprn $thispath/vndk-sp-28-arm32/* $1/lib/vndk-sp-28/
cp -fprn $thispath/vndk-sp-28-arm64/* $1/lib64/vndk-sp-28/

# exclude_srcs libs
cp -fpr $thispath/vndk-28-arm32-replace/libbinder.so $1/lib/vndk-28/
cp -fpr $thispath/vndk-28-arm64-replace/libbinder.so $1/lib64/vndk-28/
# Q lib
cp -fpr $1/lib/libstagefright_foundation.so $1/lib/vndk-28/
# modded lib
cp -fpr $thispath/vndk-28-arm32-replace/libprocinfo.so $1/lib/vndk-28/
cp -fpr $thispath/vndk-28-arm32-replace/libziparchive.so $1/lib/vndk-28/

# exclude_srcs libs
cp -fpr $thispath/vndk-sp-28-arm32-replace/libcutils.so $1/lib/vndk-sp-28/
cp -fpr $thispath/vndk-sp-28-arm64-replace/libcutils.so $1/lib64/vndk-sp-28/

# Q patched libs
toolsdir="$thispath/tools"
HOST="$(uname)"
patchelf="$toolsdir/$HOST/bin/patchelf"

$patchelf --add-needed libqinder.so $1/lib/vndk-28/libbinder.so
$patchelf --add-needed libqi.so $1/lib/vndk-28/libui.so
$patchelf --add-needed libqinder.so $1/lib/vndk-28/libui.so
$patchelf --add-needed libqui.so $1/lib/vndk-28/libgui.so
$patchelf --add-needed libqedia_helper.so $1/lib/vndk-28/libmedia_helper.so
$patchelf --add-needed libqedia_omx.so $1/lib/vndk-28/libmedia_omx.so
$patchelf --add-needed qndroid.hardware.configstore-utils.so $1/lib/vndk-28/android.hardware.configstore-utils.so
$patchelf --add-needed libqelinux.so $1/lib/vndk-28/libselinux.so

cp -fpr $1/lib/libbinder.so $1/lib/vndk-28/libqinder.so
cp -fpr $1/lib/libui.so $1/lib/vndk-28/libqi.so
cp -fpr $1/lib/libgui.so $1/lib/vndk-28/libqui.so
cp -fpr $1/lib/libmedia_helper.so $1/lib/vndk-28/libqedia_helper.so
cp -fpr $1/lib/libmedia_omx.so $1/lib/vndk-28/libqedia_omx.so
cp -fpr $1/lib/android.hardware.configstore-utils.so $1/lib/vndk-28/qndroid.hardware.configstore-utils.so
cp -fpr $1/lib/libselinux.so $1/lib/vndk-28/libqelinux.so

$patchelf --add-needed libqase.so $1/lib/vndk-sp-28/libbase.so
$patchelf --add-needed libqwbinder.so $1/lib/vndk-sp-28/libhidltransport.so
$patchelf --add-needed libqidltransport.so $1/lib/vndk-sp-28/libhidltransport.so
$patchelf --add-needed libqutils.so $1/lib/vndk-sp-28/libcutils.so
$patchelf --add-needed libqidlbase.so $1/lib/vndk-sp-28/libhidlbase.so

cp -fpr $1/lib/libbase.so $1/lib/vndk-sp-28/libqase.so
cp -fpr $1/lib/libhwbinder.so $1/lib/vndk-sp-28/libqwbinder.so
cp -fpr $1/lib/libhidltransport.so $1/lib/vndk-sp-28/libqidltransport.so
cp -fpr $1/lib/libbinderthreadstate.so $1/lib/vndk-sp-28/libbinderthreadstate.so
cp -fpr $1/lib/libcutils.so $1/lib/vndk-sp-28/libqutils.so
cp -fpr $1/lib/libhidlbase.so $1/lib/vndk-sp-28/libqidlbase.so

$patchelf --add-needed libol.so $1/lib/vndk-27/libgraphicsenv.so

$patchelf --add-needed libqinder.so $1/lib64/vndk-28/libbinder.so
$patchelf --add-needed libqi.so $1/lib64/vndk-28/libui.so
$patchelf --add-needed libqinder.so $1/lib64/vndk-28/libui.so
$patchelf --add-needed libqui.so $1/lib64/vndk-28/libgui.so
$patchelf --add-needed libqedia_helper.so $1/lib64/vndk-28/libmedia_helper.so
$patchelf --add-needed libqedia_omx.so $1/lib64/vndk-28/libmedia_omx.so
$patchelf --add-needed qndroid.hardware.configstore-utils.so $1/lib64/vndk-28/android.hardware.configstore-utils.so
$patchelf --add-needed libqelinux.so $1/lib64/vndk-28/libselinux.so

cp -fpr $1/lib64/libbinder.so $1/lib64/vndk-28/libqinder.so
cp -fpr $1/lib64/libui.so $1/lib64/vndk-28/libqi.so
cp -fpr $1/lib64/libgui.so $1/lib64/vndk-28/libqui.so
cp -fpr $1/lib64/libmedia_helper.so $1/lib64/vndk-28/libqedia_helper.so
cp -fpr $1/lib64/libmedia_omx.so $1/lib64/vndk-28/libqedia_omx.so
cp -fpr $1/lib64/android.hardware.configstore-utils.so $1/lib64/vndk-28/qndroid.hardware.configstore-utils.so
cp -fpr $1/lib64/libselinux.so $1/lib64/vndk-28/libqelinux.so

$patchelf --add-needed libqase.so $1/lib64/vndk-sp-28/libbase.so
$patchelf --add-needed libqwbinder.so $1/lib64/vndk-sp-28/libhidltransport.so
$patchelf --add-needed libqidltransport.so $1/lib64/vndk-sp-28/libhidltransport.so
$patchelf --add-needed libqutils.so $1/lib64/vndk-sp-28/libcutils.so
$patchelf --add-needed libqidlbase.so $1/lib64/vndk-sp-28/libhidlbase.so

cp -fpr $1/lib64/libbase.so $1/lib64/vndk-sp-28/libqase.so
cp -fpr $1/lib64/libhwbinder.so $1/lib64/vndk-sp-28/libqwbinder.so
cp -fpr $1/lib64/libhidltransport.so $1/lib64/vndk-sp-28/libqidltransport.so
cp -fpr $1/lib64/libbinderthreadstate.so $1/lib64/vndk-sp-28/libbinderthreadstate.so
cp -fpr $1/lib64/libcutils.so $1/lib64/vndk-sp-28/libqutils.so
cp -fpr $1/lib64/libhidlbase.so $1/lib64/vndk-sp-28/libqidlbase.so

$patchelf --add-needed libol.so $1/lib64/vndk-27/libgraphicsenv.so
