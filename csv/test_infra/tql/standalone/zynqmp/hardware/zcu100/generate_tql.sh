#!/bin/bash
#set -x

rm -rf zcu100_others.tql

source $RDI_REPOSITORY/tql/standalone/zynqmp/hardware/common/generate_tql.sh

echo $PWD

tqlfile=zcu100_others.tql
board=zcu100
module=zcu100

### Generating tql file for fsbl test cases ###

echo "######## query for fsbl_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_tql "standalone" "weekly" "64" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_tql "standalone" "weekly" "32" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_ddr_less_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_tql "standalone" "weekly" "64" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_ddr_less_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_tql "standalone" "weekly" "32" "sd0" "$tqlfile" "$module" "$board"

### Generating tql file for fsbl secure test cases ###

echo "######## query for fsbl_secure_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_secure_tql "standalone" "weekly" "64" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_secure_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_secure_tql "standalone" "weekly" "32" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_dl_secure_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_secure_tql "standalone" "weekly" "64" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_dl_secure_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_secure_tql "standalone" "weekly" "32" "sd0" "$tqlfile" "$module" "$board"

### Generating tql file for freertos test cases ###

echo "######## query for freertos_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

freertos_tql "weekly" "64" "sd0" "$tqlfile" "$module" "$board"

#echo "######## query for freertos_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#freertos_tql "weekly" "32" "sd0" "$tqlfile" "$module" "$board"

echo "######### Query for PMU Firmware test cases for module ##########" >> $tqlfile
echo -e " " >> $tqlfile

module_tql "standalone" "weekly" "$tqlfile" "xilpm_a53" "pmu_fw_examples" "pmu_fw" "$module" "$board"
module_tql "standalone" "weekly" "$tqlfile" "xilpm_r5" "pmu_fw_examples" "pmu_fw" "$module" "$board"

### Generating tql file for Fallback test cases ###

echo "######## query for fallback_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fallback_module_tql "standalone" "weekly" "64" "sd0" "$tqlfile" "$module" "$board"

#echo "######## query for fallback_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#fallback_module_tql "standalone" "weekly" "32" "sd0" "$tqlfile" "$module" "$board"

