#!/bin/bash

source common/env_var_global.sh petalinux
source common/petalinux/generate_tql_function.sh
source $RDI_DIR/tql/common/generate_tql.sh

tqlfile=$TQL_FILES_PATH/zc706/plnx_zc706.tql

count=`ls -1 $tqlfile 2>/dev/null | wc -l`
if [ $count != 0 ] ; then
        rm -rf $tqlfile
fi

echo $PWD

##### Generating tql file for plnx run #####
# EXAMPLE ENTRY: plnx_run_tql $tqlfile <test name> <variance> <test directory> <board> <priority> <prebuild/build> <module> <super suite> <test suite> <regression type> <regression subtype>
##### SYSTEST KERNEL #####
#plnx_run_tql $tqlfile "eeprom" "systest" "kernel" "zc706" "2" "prebuild" "na" "kernel" "eeprom" "daily" "functional" 
#plnx_run_tql $tqlfile "ping_board" "systest" "kernel" "zc706" "2" "prebuild" "na" "kernel" "ping_board" "daily" "functional"
#plnx_run_tql $tqlfile "ping_host" "systest" "kernel" "zc706" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
#plnx_run_tql $tqlfile "boot_kernel_SMP" "systest" "kernel" "zc706" "3" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional"
#plnx_run_tql $tqlfile "cpu_hotplug" "systest" "kernel" "zc706" "3" "prebuild" "na" "kernel" "cpu_hotplug" "daily" "functional"
#plnx_run_tql $tqlfile "plnx_initrd" "systest" "kernel" "zc706" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
#plnx_run_tql $tqlfile "suspend_resume" "systest" "kernel" "zc706" "3" "prebuild" "na" "kernel" "suspend_resume" "daily" "functional"
#plnx_run_tql $tqlfile "swdt" "systest" "kernel" "zc706" "3" "prebuild" "na" "kernel" "swdt" "daily" "functional"
#plnx_run_tql $tqlfile "flashcp_test" "systest" "kernel" "zc706" "3" "prebuild" "na" "kernel" "flashcp_test" "daily" "functional"
#plnx_run_tql $tqlfile "usb_host" "systest" "kernel" "zc706" "3" "prebuild" "na" "kernel" "usb_host" "daily" "functional"
#plnx_run_tql $tqlfile "canps" "systest" "kernel" "zc706" "3" "prebuild" "na" "kernel" "canps" "daily" "functional"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "systest" "kernel" "zc706" "1" "prebuild" "na" "kernel" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_built_kernel" "systest" "kernel" "zc706" "1" "build" "na" "kernel" "boot_built_kernel" "daily" "stress,functional,perf,sanity"

generate_common_tql "$tqlfile" "\$PLNX_DIR/tests/systest/kernel/common_tests" "" "kernel" "zc706" "zc706" "daily" "sanity,functional,performance,stress" "$PLNX_DIR/tests/msg.xml" "petalinux" "zc706_systest" "prebuild" "systest"

##### SYSTEST PLNX #####
plnx_run_tql $tqlfile "boot_built_uboot" "systest" "plnx" "zc706" "1" "build" "na" "petalinux" "boot_built_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt" "systest" "plnx" "zc706" "1" "prebuild" "na" "petalinux" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "systest" "plnx" "zc706" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"

##### SYSTEST UBOOT #####
plnx_run_tql $tqlfile "uboot_eraseenv" "systest" "uboot" "zc706" "2" "prebuild" "na" "uboot" "uboot_eraseenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_saveenv" "systest" "uboot" "zc706" "2" "prebuild" "na" "uboot" "uboot_saveenv" "daily" "stress,functional,perf,sanity"

##### QEMU KERNEL #####
plnx_run_tql $tqlfile "telnet" "qemu" "kernel" "zc706" "1" "prebuild" "na" "kernel" "telnet" "daily" "functional"
plnx_run_tql $tqlfile "ping_host" "qemu" "kernel" "zc706" "1" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
plnx_run_tql $tqlfile "eeprom" "qemu" "kernel" "zc706" "1" "prebuild" "na" "kernel" "eeprom" "daily" "functional"
plnx_run_tql $tqlfile "boot_kernel_SMP" "qemu" "kernel" "zc706" "3" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional"
plnx_run_tql $tqlfile "plnx_initrd" "qemu" "kernel" "zc706" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"

##### QEMU PLNX #####
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "qemu" "plnx" "zc706" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "qemu" "plnx" "zc706" "1" "prebuild" "na" "petalinux" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_util_gdb" "qemu" "plnx" "zc706" "1" "prebuild" "na" "petalinux" "plnx_util_gdb" "daily" "stress,functional,perf,sanity"

chmod 755 $tqlfile

