#!/bin/bash

echo "PRODUCT_COPY_FILES += \\" > vndk32.mk
echo "PRODUCT_COPY_FILES += \\" > vndk64.mk
for api in 26 27 28;do
	[ -d vndk-${api}-arm32 ] && for lib in $(ls vndk-${api}-arm32);do
		echo -e "\tvendor/vndk/vndk-${api}-arm32/$lib:system/lib/vndk-${api}/$lib \\" >> vndk32.mk
	done
	[ -d vndk-sp-${api}-arm32 ] &&for lib in $(cd vndk-sp-${api}-arm32;find -type f|sed -E 's;^\./;;g');do
		echo -e "\tvendor/vndk/vndk-sp-${api}-arm32/$lib:system/lib/vndk-sp-${api}/$lib \\" >> vndk32.mk
	done
	[ -d vndk-${api}-arm64 ] && for lib in $(ls vndk-${api}-arm64);do
		echo -e "\tvendor/vndk/vndk-${api}-arm64/$lib:system/lib64/vndk-${api}/$lib \\" >> vndk64.mk
	done
	[ -d vndk-sp-${api}-arm64 ] && for lib in $(cd vndk-sp-${api}-arm64;find -type f|sed -E 's;^\./;;g');do
		echo -e "\tvendor/vndk/vndk-sp-${api}-arm64/$lib:system/lib64/vndk-sp-${api}/$lib \\" >> vndk64.mk
	done
done
echo >> vndk32.mk
echo >> vndk64.mk
