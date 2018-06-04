#!/bin/bash

source common/env_var_global.sh petalinux
source common/petalinux/generate_tql_function.sh
source $RDI_DIR/tql/common/generate_tql.sh

tqlfile=$TQL_FILES_PATH/dc2/plnx_dc2.tql

count=`ls -1 $tqlfile 2>/dev/null | wc -l`
if [ $count != 0 ] ; then
        rm -rf $tqlfile
fi

echo $PWD

##### Generating tql file for plnx run #####
# EXAMPLE ENTRY: plnx_run_tql $tqlfile <test name> <variance> <test directory> <board> <priority> <prebuild/build> <module> <super suite> <test suite> <regression type> <regression subtype>
##### SYSTEST KERNEL #####
plnx_run_tql $tqlfile "nand_ubifs_test" "systest" "kernel" "zc1751" "1" "build" "dc2" "kernel" "nand_ubifs_test" "daily" "functional"
#plnx_run_tql $tqlfile "nand_perf_test" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "nand_perf_test" "daily" "functional"
#plnx_run_tql $tqlfile "nand_test" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "nand_test" "daily" "functional"
#plnx_run_tql $tqlfile "ping_board" "systest" "kernel" "zc1751" "2" "prebuild" "dc2" "kernel" "ping_board" "daily" "functional"
#plnx_run_tql $tqlfile "ping_host" "systest" "kernel" "zc1751" "2" "prebuild" "dc2" "kernel" "ping_host" "daily" "functional"
#plnx_run_tql $tqlfile "boot_kernel_SMP" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "boot_kernel_SMP" "daily" "functional"
#plnx_run_tql $tqlfile "plnx_initrd" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "plnx_initrd" "daily" "functional"
#plnx_run_tql $tqlfile "xen" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "xen" "daily" "functional"
#plnx_run_tql $tqlfile "flashcp_test" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "flashcp_test" "daily" "functional"
#plnx_run_tql $tqlfile "nand_mtd_oobtest_test" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "nand" "daily" "functional"
#plnx_run_tql $tqlfile "nand_mtd_readtest_test" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "nand" "daily" "functional"
#plnx_run_tql $tqlfile "nand_mtd_stresstest_test" "systest" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "nand" "daily" "functional"
plnx_run_tql $tqlfile "boot_built_kernel" "systest" "kernel" "zc1751" "1" "build" "dc2" "kernel" "boot_built_kernel" "daily" "stress,functional,perf,sanity"

generate_common_tql "$tqlfile" "\$PLNX_DIR/tests/systest/kernel/common_tests" "" "kernel" "dc2" "zc1751" "daily" "sanity,functional,performance,stress" "$PLNX_DIR/tests/msg.xml" "petalinux" "dc2_systest" "prebuild" "systest"

##### SYSTEST PLNX #####
plnx_run_tql $tqlfile "boot_built_uboot" "systest" "plnx" "zc1751" "1" "build" "dc2" "petalinux" "boot_built_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt" "systest" "plnx" "zc1751" "1" "prebuild" "dc2" "petalinux" "netboot_prebuilt" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "systest" "plnx" "zc1751" "1" "prebuild" "dc2" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"

##### QEMU KERNEL #####
plnx_run_tql $tqlfile "boot_kernel_SMP" "qemu" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "boot_kernel_SMP" "daily" "functional"
plnx_run_tql $tqlfile "ftp" "qemu" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "ftp" "daily" "functional"
plnx_run_tql $tqlfile "plnx_initrd" "qemu" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "plnx_initrd" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Echo_Test" "qemu" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "openAMP_Echo_Test" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Mat_Mul_Test" "qemu" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "openAMP_Mat_Mul_Test" "daily" "functional"
plnx_run_tql $tqlfile "openAMP_Proxy_App" "qemu" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "openAMP_Proxy_App" "daily" "functional"
plnx_run_tql $tqlfile "xen" "qemu" "kernel" "zc1751" "3" "prebuild" "dc2" "kernel" "xen" "daily" "functional"

##### QEMU PLNX #####
plnx_run_tql $tqlfile "boot_prebuilt_uboot" "qemu" "plnx" "zc1751" "1" "prebuild" "dc2" "petalinux" "boot_prebuilt_uboot" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "boot_prebuilt_kernel" "qemu" "plnx" "zc1751" "1" "prebuild" "dc2" "petalinux" "boot_prebuilt_kernel" "daily" "stress,functional,perf,sanity"
plnx_run_tql $tqlfile "netboot_prebuilt_alto" "qemu" "plnx" "zc1751" "1" "prebuild" "dc2" "petalinux" "netboot_prebuilt_alto" "daily" "stress,functional,perf,sanity"

chmod 755 $tqlfile

