#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

cp -fpr $thispath/vndk-26-arm32/* $1/lib/vndk-26/
cp -fpr $thispath/vndk-26-arm64/* $1/lib64/vndk-26/

cp -fpr $thispath/vndk-sp-26-arm32/* $1/lib/vndk-sp-26/
cp -fpr $thispath/vndk-sp-26-arm64/* $1/lib64/vndk-sp-26/

cp -fpr $thispath/vndk-27-arm32/* $1/lib/vndk-27/
cp -fpr $thispath/vndk-27-arm64/* $1/lib64/vndk-27/

cp -fpr $thispath/vndk-sp-27-arm32/* $1/lib/vndk-sp-27/
cp -fpr $thispath/vndk-sp-27-arm64/* $1/lib64/vndk-sp-27/

cp -fpr $thispath/vndk-28-arm32/* $1/lib/vndk-28/
cp -fpr $thispath/vndk-28-arm64/* $1/lib64/vndk-28/

cp -fpr $thispath/vndk-sp-28-arm32/* $1/lib/vndk-sp-28/
cp -fpr $thispath/vndk-sp-28-arm64/* $1/lib64/vndk-sp-28/

cp -fpr $thispath/lib/* $1/lib/
cp -fpr $thispath/lib64/* $1/lib64/

