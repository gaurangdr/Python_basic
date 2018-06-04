#!/bin/bash
#set -x

### Generating tql file for micoblaze test cases ###
count=`ls -1 *.tql 2>/dev/null | wc -l`
if [ $count != 0 ]; then
	rm -rf *.tql
fi

echo $PWD
SCRIPT_DIR="${OSL_DIR}/microblaze/scripts"
testcase_list=( axidma axicdma can trafgen gpio hwicap iic intc mutex uartns550 canfd emaclite axipmon tmrctr uartlite axiethernet clk_wiz sysmon spi axivdma bram usb tft srio mbox llfifo )

echo "Generating tql files for microblaze tests: ${testcase_list[@]}"

build_tql() {
	tqlfile=$1

	for testcase in "${testcase_list[@]}"; do
		echo "FROM \$OSL_DIR/microblaze/build" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\ttsuite = 'build'," >> $tqlfile
		echo -e "\t\tssuite = 'microblaze'," >> $tqlfile
		echo -e "\t\tmodule = 'kintex7'," >> $tqlfile
		echo -e "\t\tboard = 'kc705'," >> $tqlfile
		echo -e "\t\ttest_name = '${testcase}'," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		echo -e "\t\tname = 'build_microblaze_${testcase}_kc705'," >> $tqlfile
		echo -e "\t\tmessagefile = '${SCRIPT_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t}" >> $tqlfile
		echo "AS build_microblaze_${testcase}_kc705;" >> $tqlfile
		echo -e "" >> $tqlfile
	done
}

execution_tql() {
	component=$1
	reg_type=$2
	tqlfile=$3

	for testcase in "${testcase_list[@]}"; do
		echo "FROM \$OSL_DIR/microblaze/scripts" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\ttsuite = 'kintex7'," >> $tqlfile
		echo -e "\t\tssuite = 'microblaze'," >> $tqlfile
		echo -e "\t\tmodule = 'kintex7'," >> $tqlfile
		echo -e "\t\tboard = 'kc705'," >> $tqlfile
		echo -e "\t\ttest_name = '${testcase}'," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
		echo -e "\t\tname = 'microblaze_${testcase}_kc705'," >> $tqlfile
		echo -e "\t\tmessagefile = '${SCRIPT_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t}" >> $tqlfile
		echo "AS microblaze_${testcase}_kc705;" >> $tqlfile
		echo -e "" >> $tqlfile
	done
}

### generate tql files for build test cases ###
tqlfile=build.tql

echo "######## query for build microblaze test cases #########" >> $tqlfile
echo -e "" >> $tqlfile
build_tql "$tqlfile"

chmod 755 $tqlfile

### Generating tql file for execution test cases ###

tqlfile=execution.tql

echo "######## query for execution microblaze test cases #########" >> $tqlfile
echo -e "" >> $tqlfile

execution_tql "standalone" "sanity,daily" "$tqlfile"

chmod 755 $tqlfile

echo "done....thanks"
exit 0
