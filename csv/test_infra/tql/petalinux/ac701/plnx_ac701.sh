#!/bin/bash

source common/env_var_global.sh petalinux
source common/petalinux/generate_tql_function.sh
source $RDI_DIR/tql/common/generate_tql.sh

tqlfile=$TQL_FILES_PATH/ac701/plnx_ac701.tql

count=`ls -1 $tqlfile 2>/dev/null | wc -l`
if [ $count != 0 ] ; then
        rm -rf $tqlfile
fi

echo $PWD

##### Generating tql file for plnx run #####
# EXAMPLE ENTRY: plnx_run_tql $tqlfile <test name> <variance> <test directory> <board> <priority> <prebuild/build> <module> <super suite> <test suite> <regression type> <regression subtype>
##### SYSTEST KERNEL #####
#plnx_run_tql $tqlfile "boot_kernel_SMP" "systest" "kernel" "ac701" "3" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional" 
#plnx_run_tql $tqlfile "flashcp_test" "systest" "kernel" "ac701" "3" "prebuild" "na" "kernel" "flashcp_test" "daily" "functional"
#plnx_run_tql $tqlfile "eeprom" "systest" "kernel" "ac701" "3" "prebuild" "na" "kernel" "eeprom" "daily" "functional"
#plnx_run_tql $tqlfile "ping_board" "systest" "kernel" "ac701" "2" "prebuild" "na" "kernel" "ping_board" "daily" "functional"
#plnx_run_tql $tqlfile "ping_host" "systest" "kernel" "ac701" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
#plnx_run_tql $tqlfile "plnx_initrd" "systest" "kernel" "ac701" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
#plnx_run_tql $tqlfile "flash_eraseall_test" "systest" "kernel" "ac701" "2" "prebuild" "na" "kernel" "flash_eraseall_test" "daily" "functional"
#plnx_run_tql $tqlfile "flash_dd_test" "systest" "kernel" "ac701" "2" "prebuild" "na" "kernel" "flash_dd_test" "daily" "functional"
#plnx_run_tql $tqlfile "reboot" "systest" "kernel" "ac701" "2" "prebuild" "na" "kernel" "reboot" "daily" "functional"
#plnx_run_tql $tqlfile "ftp" "systest" "kernel" "ac701" "3" "prebuild" "na" "kernel" "ftp" "daily" "functional"
#plnx_run_tql $tqlfile "telnet" "systest" "kernel" "ac701" "3" "prebuild" "na" "kernel" "telnet" "daily" "functional"
#plnx_run_tql $tqlfile "mcs" "systest" "kernel" "ac701" "3" "prebuild" "na" "kernel" "mcs" "daily" "functional"
plnx_run_tql $tqlfile "boot_built_kernel" "systest" "kernel" "ac701" "3" "build" "na" "kernel" "boot_built_kernel" "daily" "stress,functional,perf,sanity" 
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "systest" "kernel" "ac701" "3" "prebuild" "na" "kernel" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"

generate_common_tql "$tqlfile" "\$PLNX_DIR/tests/systest/kernel/common_tests" "" "kernel" "ac701" "ac701" "daily" "sanity,functional,performance,stress" "$PLNX_DIR/tests/msg.xml" "petalinux" "ac701_systest" "prebuild" "systest"

##### SYSTEST PLNX #####
plnx_run_tql $tqlfile "boot_built_uboot" "systest" "plnx" "ac701" "1" "build" "na" "petalinux" "boot_built_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt" "systest" "plnx" "ac701" "1" "prebuild" "na" "petalinux" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "systest" "plnx" "ac701" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "jtag_kernel" "systest" "plnx" "ac701" "1" "prebuild" "na" "petalinux" "jtag_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_boot_jtag" "systest" "plnx" "ac701" "1" "prebuild" "na" "petalinux" "plnx_boot_jtag" "daily" "stress,functional,perf,sanity"

##### SYSTEST UBOOT #####
plnx_run_tql $tqlfile "uboot_saveenv" "systest" "uboot" "ac701" "2" "prebuild" "na" "uboot" "uboot_saveenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_reset" "systest" "uboot" "ac701" "2" "prebuild" "na" "uboot" "uboot_reset" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_eraseenv" "systest" "uboot" "ac701" "2" "prebuild" "na" "uboot" "uboot_eraseenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_update_uboot" "systest" "uboot" "ac701" "2" "prebuild" "na" "uboot" "uboot_update_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_update_kernel" "systest" "uboot" "ac701" "2" "prebuild" "na" "uboot" "uboot_update_kernel" "daily" "stress,functional,perf,sanity"

##### QEMU KERNEL #####
plnx_run_tql $tqlfile "telnet" "qemu" "kernel" "ac701" "2" "prebuild" "na" "kernel" "telnet" "daily" "functional"
plnx_run_tql $tqlfile "ping_host" "qemu" "kernel" "ac701" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
plnx_run_tql $tqlfile "ftp" "qemu" "kernel" "ac701" "3" "prebuild" "na" "kernel" "ftp" "daily" "functional"
plnx_run_tql $tqlfile "plnx_initrd" "qemu" "kernel" "ac701" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"

##### QEMU PLNX #####
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "qemu" "plnx" "ac701" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "qemu" "plnx" "ac701" "1" "prebuild" "na" "petalinux" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_util_gdb" "qemu" "plnx" "ac701" "1" "prebuild" "na" "petalinux" "plnx_util_gdb" "daily" "stress,functional,perf,sanity"

##### QEMU UBOOT #####
plnx_run_tql $tqlfile "uboot_saveenv" "qemu" "uboot" "ac701" "1" "prebuild" "na" "uboot" "uboot_saveenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_eraseenv" "qemu" "uboot" "ac701" "1" "prebuild" "na" "uboot" "uboot_eraseenv"  "daily" "stress,functional,perf,sanity"
 
chmod 755 $tqlfile

