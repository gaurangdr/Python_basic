#!/bin/bash

source common/env_var_global.sh petalinux
source common/petalinux/generate_tql_function.sh
source $RDI_DIR/tql/common/generate_tql.sh
        
tqlfile=$TQL_FILES_PATH/zcu102/plnx_zcu102.tql

count=`ls -1 $tqlfile 2>/dev/null | wc -l`
if [ $count != 0 ] ; then
        rm -rf $tqlfile
fi

echo $PWD

##### Generating tql file for plnx run #####
# EXAMPLE ENTRY: plnx_run_tql $tqlfile <test name> <variance> <test directory> <board> <priority> <prebuild/build> <module> <super suite> <test suite> <regression type> <regression subtype>
##### SYSTEST KERNEL #####
plnx_run_tql $tqlfile "qspi_boot" "systest" "kernel" "zcu102" "3" "build" "na" "kernel" "qspi_boot" "daily" "functional"
plnx_run_tql $tqlfile "fpgaManager" "systest" "kernel" "zcu102" "3" "build" "na" "kernel" "fpgaManager" "daily" "functional"
plnx_run_tql $tqlfile "sdboot_rootfs_ext4" "systest" "kernel" "zcu102" "3" "build" "na" "kernel" "sdboot_rootfs_ext4" "daily" "functional"
#plnx_run_tql $tqlfile "eeprom" "systest" "kernel" "zcu102" "2" "prebuild" "na" "kernel" "eeprom" "daily" "functional"
#plnx_run_tql $tqlfile "ping_board" "systest" "kernel" "zcu102" "2" "prebuild" "na" "kernel" "ping_board" "daily" "functional"
#plnx_run_tql $tqlfile "ping_host" "systest" "kernel" "zcu102" "2" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
#plnx_run_tql $tqlfile "boot_kernel_SMP" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional"
#plnx_run_tql $tqlfile "plnx_initrd" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
#plnx_run_tql $tqlfile "xen" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "xen" "daily" "functional"
#plnx_run_tql $tqlfile "sd_boot" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "sd_boot" "daily" "functional"
#plnx_run_tql $tqlfile "sata" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "sata" "daily" "functional"
#plnx_run_tql $tqlfile "canps" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "canps" "daily" "functional"
#plnx_run_tql $tqlfile "rtc" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "rtc" "daily" "functional"
#plnx_run_tql $tqlfile "openAMP_EchoTest" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "openAMP_EchoTest" "daily" "functional"
#plnx_run_tql $tqlfile "openAMP_MatMul" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "openAMP_MatMul" "daily" "functional"
#plnx_run_tql $tqlfile "openAMP_Proxy" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "openAMP_Proxy" "daily" "functional"
#plnx_run_tql $tqlfile "usb_host" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "usb_host" "daily" "functional"
#plnx_run_tql $tqlfile "swdt" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "swdt" "daily" "functional"
#plnx_run_tql $tqlfile "flashcp_test" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "flashcp_test" "daily" "functional"
#plnx_run_tql $tqlfile "dma_test" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "dma_test" "daily" "functional"
plnx_run_tql $tqlfile "usb_rootfs_ext4" "systest" "kernel" "zcu102" "3" "build" "na" "kernel" "usb_rootfs_ext4" "daily" "functional"
plnx_run_tql $tqlfile "sata_rootfs_ext4" "systest" "kernel" "zcu102" "3" "build" "na" "kernel" "sata_rootfs_ext4" "daily" "functional"
plnx_run_tql $tqlfile "ethernet_speed_test" "systest" "kernel" "zcu102" "3" "build" "na" "kernel" "ethernet_speed_test" "daily" "functional"
#plnx_run_tql $tqlfile "sd" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "sd" "daily" "functional"
#plnx_run_tql $tqlfile "cpu_hotplug" "systest" "kernel" "zcu102" "3" "prebuild" "na" "kernel" "cpu_hotplug" "daily" "functional"
plnx_run_tql $tqlfile "sdsoc_conformance" "systest" "kernel" "zcu102" "3" "build" "na" "kernel" "sdsoc_conformance" "daily" "functional"
plnx_run_tql $tqlfile "sdsoc_mmult" "systest" "kernel" "zcu102" "3" "build" "na" "kernel" "sdsoc_mmult" "daily" "functional"
plnx_run_tql $tqlfile "boot_built_kernel" "systest" "kernel" "zcu102" "1" "build" "na" "kernel" "boot_built_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "systest" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"

generate_common_tql "$tqlfile" "\$PLNX_DIR/tests/systest/kernel/common_tests" "" "kernel" "zcu102" "zcu102" "daily" "sanity,functional,performance,stress" "$PLNX_DIR/tests/msg.xml" "petalinux" "zcu102_systest" "prebuild" "systest"

##### SYSTEST PLNX #####
plnx_run_tql $tqlfile "boot_built_uboot" "systest" "plnx" "zcu102" "1" "build" "na" "petalinux" "boot_built_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt" "systest" "plnx" "zcu102" "1" "prebuild" "na" "petalinux" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "systest" "plnx" "zcu102" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_template" "systest" "plnx" "zcu102" "3" "build" "na" "petalinux" "plnx_template" "daily" "stress,functional,perf,sanity"

##### SYSTEST UBOOT #####
plnx_run_tql $tqlfile "uboot_eraseenv" "systest" "uboot" "zcu102" "2" "prebuild" "na" "uboot" "uboot_eraseenv" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "uboot_saveenv" "systest" "uboot" "zcu102" "2" "prebuild" "na" "uboot" "uboot_saveenv" "daily" "stress,functional,perf,sanity"

##### QEMU KERNEL #####
plnx_run_tql $tqlfile "telnet" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "telnet" "daily" "functional"
plnx_run_tql $tqlfile "ping_host" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "ping_host" "daily" "functional"
plnx_run_tql $tqlfile "eeprom" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "eeprom" "daily" "functional"
plnx_run_tql $tqlfile "boot_kernel_SMP" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "boot_kernel_SMP" "daily" "functional"
plnx_run_tql $tqlfile "ftp" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "ftp" "daily" "functional"
plnx_run_tql $tqlfile "plnx_initrd" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "plnx_initrd" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Echo_Test" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "openAMP_Echo_Test" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Mat_Mul_Test" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "openAMP_Mat_Mul_Test" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Proxy_App" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "openAMP_Proxy_App" "daily" "functional"
plnx_run_tql $tqlfile "xen" "qemu" "kernel" "zcu102" "1" "prebuild" "na" "kernel" "xen" "daily" "functional"

##### QEMU PLNX #####
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "qemu" "plnx" "zcu102" "1" "prebuild" "na" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "qemu" "plnx" "zcu102" "1" "prebuild" "na" "petalinux" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "plnx_util_gdb" "qemu" "plnx" "zcu102" "1" "prebuild" "na" "petalinux" "plnx_util_gdb" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt_alto" "qemu" "plnx" "zcu102" "1" "prebuild" "na" "petalinux" "netboot_prebuilt_alto" "daily" "stress,functional,perf,sanity"

chmod 755 $tqlfile

