#!/bin/bash

source common/env_var_global.sh petalinux
source common/petalinux/generate_tql_function.sh
source $RDI_DIR/tql/common/generate_tql.sh
	
tqlfile=$TQL_FILES_PATH/kcu105/plnx_kcu105.tql

count=`ls -1 $tqlfile 2>/dev/null | wc -l`
if [ $count != 0 ] ; then
        rm -rf $tqlfile
fi

echo $PWD

##### Generating tql file for plnx run #####
# EXAMPLE ENTRY: plnx_run_tql $tqlfile <test name> <variance> <test directory> <board> <priority> <prebuild/build> <module> <super suite> <test suite> <regression type> <regression subtype>
##### SYSTEST KERNEL #####
#plnx_run_tql $tqlfile "eeprom" "systest" "kernel" "kcu105" "2" "prebuild" "na" "kernel" "eeprom" "daily" "functional" 
#plnx_run_tql $tqlfile "ping_board" "systest" "kernel" "kcu105" "2" "prebuild" "na" "kernel" "ping_board" "daily" "functional"
#plnx_run_tql $tqlfile "ping_host" "systest" "kernel" "kcu105" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
#plnx_run_tql $tqlfile "boot_kernel_SMP" "systest" "kernel" "kcu105" "3" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional"
#plnx_run_tql $tqlfile "plnx_initrd" "systest" "kernel" "kcu105" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
#plnx_run_tql $tqlfile "flashcp_test" "systest" "kernel" "kcu105" "3" "prebuild" "na" "kernel" "flashcp_test" "daily" "functional"
plnx_run_tql $tqlfile "boot_built_kernel" "systest" "kernel" "kcu105" "1" "build" "na" "kernel" "boot_built_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "systest" "kernel" "kcu105" "1" "prebuild" "na" "kernel" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"

generate_common_tql "$tqlfile" "\$PLNX_DIR/tests/systest/kernel/common_tests" "" "kernel" "kcu105" "kcu105" "daily" "sanity,functional,performance,stress" "$PLNX_DIR/tests/msg.xml" "petalinux" "kcu105_systest" "prebuild" "systest"

##### SYSTEST PLNX #####
plnx_run_tql $tqlfile "boot_built_uboot" "systest" "plnx" "kcu105" "1" "build" "na" "petalinux" "boot_built_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt" "systest" "plnx" "kcu105" "1" "prebuild" "na" "petalinux" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "systest" "plnx" "kcu105" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"

##### SYSTEST UBOOT #####
plnx_run_tql $tqlfile "uboot_eraseenv" "systest" "uboot" "kcu105" "2" "prebuild" "na" "uboot" "uboot_eraseenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_saveenv" "systest" "uboot" "kcu105" "2" "prebuild" "na" "uboot" "uboot_saveenv" "daily" "stress,functional,perf,sanity"

##### QEMU KERNEL #####
plnx_run_tql $tqlfile "telnet" "qemu" "kernel" "kcu105" "2" "prebuild" "na" "kernel" "telnet" "daily" "functional"
plnx_run_tql $tqlfile "ping_host" "qemu" "kernel" "kcu105" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
plnx_run_tql $tqlfile "ftp" "qemu" "kernel" "kcu105" "2" "prebuild" "na" "kernel" "ftp" "daily" "functional"
plnx_run_tql $tqlfile "plnx_initrd" "qemu" "kernel" "kcu105" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"

##### QEMU PLNX #####
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "qemu" "plnx" "kcu105" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "qemu" "plnx" "kcu105" "1" "prebuild" "na" "petalinux" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_util_gdb" "qemu" "plnx" "kcu105" "1" "prebuild" "na" "petalinux" "plnx_util_gdb" "daily" "stress,functional,perf,sanity"

##### QEMU UBOOT #####
plnx_run_tql $tqlfile "uboot_saveenv" "qemu" "uboot" "kcu105" "1" "prebuild" "na" "uboot" "uboot_saveenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_eraseenv" "qemu" "uboot" "kcu105" "1" "prebuild" "na" "uboot" "uboot_eraseenv" "daily" "stress,functional,perf,sanity"

chmod 755 $tqlfile

