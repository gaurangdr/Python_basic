#!/bin/bash
#set -x

rm -rf zcu102_others.tql

source $RDI_REPOSITORY/tql/standalone/zynqmp/hardware/common/generate_tql.sh

echo $PWD

tqlfile=zcu102_others.tql
board=zcu102
module=zcu102

### Generating tql file for fsbl test cases ###

echo "######## query for fsbl_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_tql "standalone" "sanity,daily" "64" "qspi32" "$tqlfile" "$module" "$board"
fsbl_tql "standalone" "sanity,daily" "64" "qspi24" "$tqlfile" "$module" "$board"
fsbl_tql "standalone" "sanity,daily" "64" "sd1" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_tql "standalone" "sanity,daily" "32" "qspi32" "$tqlfile" "$module" "$board"
fsbl_tql "standalone" "sanity,daily" "32" "qspi24" "$tqlfile" "$module" "$board"
fsbl_tql "standalone" "sanity,daily" "32" "sd1" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_ddr_less_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_tql "standalone" "sanity,daily" "64" "qspi32" "$tqlfile" "$module" "$board"
fsbl_dl_tql "standalone" "sanity,daily" "64" "qspi24" "$tqlfile" "$module" "$board"
fsbl_dl_tql "standalone" "sanity,daily" "64" "sd1" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_ddr_less_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_tql "standalone" "sanity,daily" "32" "qspi32" "$tqlfile" "$module" "$board"
fsbl_dl_tql "standalone" "sanity,daily" "32" "qspi24" "$tqlfile" "$module" "$board"
fsbl_dl_tql "standalone" "sanity,daily" "32" "sd1" "$tqlfile" "$module" "$board"

### Generating tql file for fsbl secure test cases ###

echo "######## query for fsbl_secure_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_secure_tql "standalone" "sanity,daily" "64" "qspi32" "$tqlfile" "$module" "$board"
fsbl_secure_tql "standalone" "sanity,daily" "64" "qspi24" "$tqlfile" "$module" "$board"
fsbl_secure_tql "standalone" "sanity,daily" "64" "sd1" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_secure_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_secure_tql "standalone" "sanity,daily" "32" "qspi32" "$tqlfile" "$module" "$board"
fsbl_secure_tql "standalone" "sanity,daily" "32" "qspi24" "$tqlfile" "$module" "$board"
fsbl_secure_tql "standalone" "sanity,daily" "32" "sd1" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_dl_secure_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_secure_tql "standalone" "sanity,daily" "64" "qspi32" "$tqlfile" "$module" "$board"
fsbl_dl_secure_tql "standalone" "sanity,daily" "64" "qspi24" "$tqlfile" "$module" "$board"
fsbl_dl_secure_tql "standalone" "sanity,daily" "64" "sd1" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_dl_secure_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_secure_tql "standalone" "sanity,daily" "32" "qspi32" "$tqlfile" "$module" "$board"
fsbl_dl_secure_tql "standalone" "sanity,daily" "32" "qspi24" "$tqlfile" "$module" "$board"
fsbl_dl_secure_tql "standalone" "sanity,daily" "32" "sd1" "$tqlfile" "$module" "$board"

### Generating tql file for freertos test cases ###

echo "######## query for freertos_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

freertos_tql "sanity,daily" "64" "qspi32" "$tqlfile" "$module" "$board"
freertos_tql "sanity,daily" "64" "qspi24" "$tqlfile" "$module" "$board"
freertos_tql "sanity,daily" "64" "sd1" "$tqlfile" "$module" "$board"

#echo "######## query for freertos_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#freertos_tql "sanity,daily" "32" "qspi32" "$tqlfile" "$module" "$board"
#freertos_tql "sanity,daily" "32" "qspi24" "$tqlfile" "$module" "$board"
#freertos_tql "sanity,daily" "32" "sd1" "$tqlfile" "$module" "$board"

echo "######### Query for PMU Firmware test cases for module ##########" >> $tqlfile
echo -e " " >> $tqlfile

module_tql "standalone" "sanity,daily" "$tqlfile" "xilpm_a53" "pmu_fw_examples" "pmu_fw" "$module" "$board"
module_tql "standalone" "sanity,daily" "$tqlfile" "xilpm_r5" "pmu_fw_examples" "pmu_fw" "$module" "$board"

### Generating tql file for Fallback test cases ###

echo "######## query for fallback_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fallback_module_tql "standalone" "sanity,daily" "64" "qspi32" "$tqlfile" "$module" "$board"
fallback_module_tql "standalone" "sanity,daily" "64" "qspi24" "$tqlfile" "$module" "$board"
fallback_module_tql "standalone" "sanity,daily" "64" "sd1" "$tqlfile" "$module" "$board"

#echo "######## query for fallback_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#fallback_module_tql "standalone" "sanity,daily" "32" "qspi32" "$tqlfile" "$module" "$board"
#fallback_module_tql "standalone" "sanity,daily" "32" "qspi24" "$tqlfile" "$module" "$board"
#fallback_module_tql "standalone" "sanity,daily" "32" "sd1" "$tqlfile" "$module" "$board"

chmod 755 $tqlfile

