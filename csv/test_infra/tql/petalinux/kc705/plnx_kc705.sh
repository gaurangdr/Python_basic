#!/bin/bash

source common/env_var_global.sh petalinux
source common/petalinux/generate_tql_function.sh
source $RDI_DIR/tql/common/generate_tql.sh

tqlfile=$TQL_FILES_PATH/kc705/plnx_kc705.tql

count=`ls -1 $tqlfile 2>/dev/null | wc -l`
if [ $count != 0 ] ; then
        rm -rf $tqlfile
fi

echo $PWD

##### Generating tql file for plnx run #####
# EXAMPLE ENTRY: plnx_run_tql $tqlfile <test name> <variance> <test directory> <board> <priority> <prebuild/build> <module> <super suite> <test suite> <regression type> <regression subtype>
##### SYSTEST KERNEL #####
#plnx_run_tql $tqlfile "eeprom" "systest" "kernel" "kc705" "2" "prebuild" "na" "kernel" "eeprom" "daily" "functional"
#plnx_run_tql $tqlfile "ping_board" "systest" "kernel" "kc705" "2" "prebuild" "na" "kernel" "ping_board" "daily" "functional"
#plnx_run_tql $tqlfile "ping_host" "systest" "kernel" "kc705" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
#plnx_run_tql $tqlfile "boot_kernel_SMP" "systest" "kernel" "kc705" "3" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional"
#plnx_run_tql $tqlfile "plnx_initrd" "systest" "kernel" "kc705" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
#plnx_run_tql $tqlfile "flashcp_test" "systest" "kernel" "kc705" "3" "prebuild" "na" "kernel" "flashcp_test" "daily" "functional"
#plnx_run_tql $tqlfile "flash_eraseall_test" "systest" "kernel" "kc705" "2" "prebuild" "na" "kernel" "flash_eraseall_test" "daily" "functional"
#plnx_run_tql $tqlfile "flash_dd_test" "systest" "kernel" "kc705" "2" "prebuild" "na" "kernel" "flash_dd_test" "daily" "functional"
#plnx_run_tql $tqlfile "reboot" "systest" "kernel" "kc705" "2" "prebuild" "na" "kernel" "reboot" "daily" "functional"
#plnx_run_tql $tqlfile "ftp" "systest" "kernel" "kc705" "3" "prebuild" "na" "kernel" "ftp" "daily" "functional"
#plnx_run_tql $tqlfile "telnet" "systest" "kernel" "kc705" "3" "prebuild" "na" "kernel" "telnet" "daily" "functional"
#plnx_run_tql $tqlfile "mcs" "systest" "kernel" "kc705" "3" "prebuild" "na" "kernel" "mcs" "daily" "functional"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "systest" "kernel" "kc705" "1" "prebuild" "na" "kernel" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_built_kernel" "systest" "kernel" "kc705" "1" "build" "na" "kernel" "boot_built_kernel" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"

generate_common_tql "$tqlfile" "\$PLNX_DIR/tests/systest/kernel/common_tests" "" "kernel" "kc705" "kc705" "daily" "sanity,functional,performance,stress" "$PLNX_DIR/tests/msg.xml" "petalinux" "kc705_systest" "prebuild" "systest"

##### SYSTEST PLNX #####
plnx_run_tql $tqlfile "boot_built_uboot" "systest" "plnx" "kc705" "1" "build" "na" "petalinux" "boot_built_uboot" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt" "systest" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "systest" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_apps_mod_lib" "systest" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "plnx_apps_mod_lib" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "jtag_kernel" "systest" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "jtag_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_boot_jtag" "systest" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "plnx_boot_jtag" "daily" "stress,functional,perf,sanity"

##### SYSTEST UBOOT #####
plnx_run_tql $tqlfile "uboot_eraseenv" "systest" "uboot" "kc705" "2" "prebuild" "na" "uboot" "uboot_eraseenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_saveenv" "systest" "uboot" "kc705" "2" "prebuild" "na" "uboot" "uboot_saveenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_update_uboot" "systest" "uboot" "kc705" "2" "prebuild" "na" "uboot" "uboot_update_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_update_kernel" "systest" "uboot" "kc705" "2" "prebuild" "na" "uboot" "uboot_update_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_reset" "systest" "uboot" "kc705" "2" "prebuild" "na" "uboot" "uboot_reset" "daily" "stress,functional,perf,sanity"
##### QEMU KERNEL #####
plnx_run_tql $tqlfile "flash_eraseall_test" "qemu" "kernel" "kc705" "2" "prebuild" "na" "kernel" "flash_eraseall_test" "daily" "functional"
plnx_run_tql $tqlfile "telnet" "qemu" "kernel" "kc705" "2" "prebuild" "na" "kernel" "telnet" "daily" "functional"
plnx_run_tql $tqlfile "ping_host" "qemu" "kernel" "kc705" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
plnx_run_tql $tqlfile "ftp" "qemu" "kernel" "kc705" "3" "prebuild" "na" "kernel" "ftp" "daily" "functional"
plnx_run_tql $tqlfile "plnx_initrd" "qemu" "kernel" "kc705" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
plnx_run_tql $tqlfile "flash_dd_test" "qemu" "kernel" "kc705" "2" "prebuild" "na" "kernel" "flash_dd_test" "daily" "functional"
##### QEMU PLNX #####
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "qemu" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "qemu" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_util_gdb" "qemu" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "plnx_util_gdb" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_compiled_kernel" "qemu" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "boot_compiled_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "new_app_cpp" "qemu" "plnx" "kc705" "1" "prebuild" "na" "petalinux" "new_app_cpp" "daily" "stress,functional,perf,sanity"

##### QEMU UBOOT #####
plnx_run_tql $tqlfile "uboot_saveenv" "qemu" "uboot" "kc705" "1" "prebuild" "na" "uboot" "uboot_saveenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_eraseenv" "qemu" "uboot" "kc705" "1" "prebuild" "na" "uboot" "uboot_eraseenv" "daily" "stress,functional,perf,sanity"
chmod 755 $tqlfile

