#!/bin/bash
#set -x

rm -rf dc5_others.tql

source $RDI_REPOSITORY/tql/standalone/zynqmp/hardware/common/generate_tql.sh

echo $PWD

tqlfile=dc5_others.tql
module=dc5
board=zc1751

echo "######## query for fsbl_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_tql "standalone" "sanity,daily" "64" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_tql "standalone" "sanity,daily" "32" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_ddr_less_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_tql "standalone" "sanity,daily" "64" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_ddr_less_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_tql "standalone" "sanity,daily" "32" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_secure_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_secure_tql "standalone" "sanity,daily" "64" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_secure_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_secure_tql "standalone" "sanity,daily" "32" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_dl_secure_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_secure_tql "standalone" "sanity,daily" "64" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fsbl_dl_secure_32 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fsbl_dl_secure_tql "standalone" "sanity,daily" "32" "sd0" "$tqlfile" "$module" "$board"

echo "######## query for fallback_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

fallback_module_tql "standalone" "sanity,daily" "64" "sd0" "$tqlfile" "$module" "$board"

#echo "######## query for fallback_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#fallback_module_tql "standalone" "sanity,daily" "32" "sd0" "$tqlfile" "$module" "$board"

