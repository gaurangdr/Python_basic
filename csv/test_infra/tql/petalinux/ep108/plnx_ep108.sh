#!/bin/bash

source common/env_var_global.sh petalinux
source common/petalinux/generate_tql_function.sh
source $RDI_DIR/tql/common/generate_tql.sh

tqlfile=$TQL_FILES_PATH/ep108/plnx_ep108.tql

count=`ls -1 $tqlfile 2>/dev/null | wc -l`
if [ $count != 0 ] ; then
        rm -rf $tqlfile
fi

echo $PWD

##### Generating tql file for plnx run #####
# EXAMPLE ENTRY: plnx_run_tql $tqlfile <test name> <variance> <test directory> <board> <priority> <prebuild/build> <module> <super suite> <test suite> <regression type> <regression subtype>
##### SYSTEST KERNEL #####
#plnx_run_tql $tqlfile "eeprom" "systest" "kernel" "ep108" "2" "prebuild" "na" "kernel" "eeprom" "daily" "functional"
#plnx_run_tql $tqlfile "ping_board" "systest" "kernel" "ep108" "2" "prebuild" "na" "kernel" "ping_board" "daily" "functional"
#plnx_run_tql $tqlfile "ping_host" "systest" "kernel" "ep108" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
#plnx_run_tql $tqlfile "flash_eraseall_test" "systest" "kernel" "ep108" "2" "prebuild" "na" "kernel" "flash_eraseall_test" "daily" "functional"
#plnx_run_tql $tqlfile "flash_dd_test" "systest" "kernel" "ep108" "2" "prebuild" "na" "kernel" "flash_dd_test" "daily" "functional"
#plnx_run_tql $tqlfile "boot_kernel_SMP" "systest" "kernel" "ep108" "3" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional"
#plnx_run_tql $tqlfile "cpu_hotplug" "systest" "kernel" "ep108" "3" "prebuild" "na" "kernel" "cpu_hotplug" "daily" "functional"
#plnx_run_tql $tqlfile "ftp" "systest" "kernel" "ep108" "3" "prebuild" "na" "kernel" "ftp" "daily" "functional"
#plnx_run_tql $tqlfile "plnx_initrd" "systest" "kernel" "ep108" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
#plnx_run_tql $tqlfile "telnet" "systest" "kernel" "ep108" "3" "prebuild" "na" "kernel" "telnet" "daily" "functional"

generate_common_tql "$tqlfile" "\$PLNX_DIR/tests/systest/kernel/common_tests" "" "kernel" "ep108" "ep108" "daily" "sanity,functional,performance,stress" "$PLNX_DIR/tests/msg.xml" "petalinux" "ep108_systest" "prebuild" "systest"
 
##### SYSTEST PLNX #####
plnx_run_tql $tqlfile "netboot_prebuilt" "systest" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_boot_jtag" "systest" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "plnx_boot_jtag" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "systest" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"

##### QEMU KERNEL #####
plnx_run_tql $tqlfile "telnet" "qemu" "kernel" "ep108" "3" "prebuild" "na" "kernel" "telnet" "daily" "functional"
plnx_run_tql $tqlfile "ping_host" "qemu" "kernel" "ep108" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
plnx_run_tql $tqlfile "eeprom" "qemu" "kernel" "ep108" "2" "prebuild" "na" "kernel" "eeprom" "daily" "functional"
plnx_run_tql $tqlfile "boot_kernel_SMP" "kernel" "kernel" "ep108" "3" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional"
plnx_run_tql $tqlfile "ftp" "qemu" "kernel" "ep108" "3" "prebuild" "na" "kernel" "ftp" "daily" "functional"
plnx_run_tql $tqlfile "plnx_initrd" "qemu" "kernel" "ep108" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Echo_Test" "qemu" "kernel" "ep108" "3" "prebuild" "na" "kernel" "openAMP_Echo_Test" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Mat_Mul_Test" "qemu" "kernel" "ep108" "3" "prebuild" "na" "kernel" "openAMP_Mat_Mul_Test" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Proxy_App" "qemu" "kernel" "ep108" "3" "prebuild" "na" "kernel" "openAMP_Proxy_App" "daily" "functional"
plnx_run_tql $tqlfile "xen" "qemu" "kernel" "ep108" "3" "prebuild" "na" "kernel" "xen" "daily" "functional"

##### QEMU PLNX #####
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "qemu" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "qemu" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_compiled_kernel" "qemu" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "boot_compiled_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "new_app_cpp" "qemu" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "new_app_cpp" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_util_gdb" "qemu" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "plnx_util_gdb" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt_alto" "qemu" "plnx" "ep108" "1" "prebuild" "na" "petalinux" "netboot_prebuilt_alto" "daily" "stress,functional,perf,sanity"

chmod 755 $tqlfile

