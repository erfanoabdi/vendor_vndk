#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

# Copy phh stuffs
#cp -fpr $thispath/vndk-26-arm32 $1/lib/vndk-26
#cp -fpr $thispath/vndk-26-arm64 $1/lib64/vndk-26
#cp -fpr $thispath/vndk-sp-26-arm32 $1/lib/vndk-sp-26
#cp -fpr $thispath/vndk-sp-26-arm64 $1/lib64/vndk-sp-26
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
cp -fpr $thispath/vndk-28-arm32/* $1/lib/vndk-28/
cp -fpr $thispath/vndk-28-arm64/* $1/lib64/vndk-28/
# exclude_srcs libs
cp -fpr $thispath/vndk-28-arm32-replace/libgui.so $1/lib/vndk-28/
cp -fpr $thispath/vndk-28-arm64-replace/libgui.so $1/lib64/vndk-28/
cp -fpr $thispath/vndk-28-arm32-replace/libbinder.so $1/lib/vndk-28/
cp -fpr $thispath/vndk-28-arm64-replace/libbinder.so $1/lib64/vndk-28/
mkdir -p $1/lib/vndk-sp-28
mkdir -p $1/lib64/vndk-sp-28
cp -fpr $thispath/vndk-sp-28-arm32/* $1/lib/vndk-sp-28/
cp -fpr $thispath/vndk-sp-28-arm64/* $1/lib64/vndk-sp-28/
# exclude_srcs libs
cp -fpr $thispath/vndk-sp-28-arm32-replace/libcutils.so $1/lib/vndk-sp-28/
cp -fpr $thispath/vndk-sp-28-arm64-replace/libcutils.so $1/lib64/vndk-sp-28/
# more
$thispath/moreP/make.sh "$systempath"
