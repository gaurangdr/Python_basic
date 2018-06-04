#!/bin/bash
#set -x

### Generating tql file for zynq build test cases ###
count=`ls -1 *_zynq.tql 2>/dev/null | wc -l`
if [ $count != 0 ]; then
	rm -rf *_zynq.tql
fi
echo "$ZYNQ_BUILD_TESTS"
BUILD_DIR="${ZYNQ_BUILD_TESTS}/build_tests"
cmd=
name=

echo "Generating tql files for zynq build tests"

fetch_cmd() {
	cmd=
if [ -f $1/test.info ];
then
        cmd=`grep -nrF 'COMMAND' $1/test.info | cut -d':' -f3 | sed 's/^[ \t]*//;s/[ \t]*$//'`
	cmd=`echo ${cmd} | sed s///g`
fi
}

fetch_name() {
	name=
if [ -f $1/test.info ];
then
        name=`grep -nrF 'NAME' $1/test.info | cut -d':' -f3 | sed 's/^[ \t]*//;s/[ \t]*$//'`
	name=`echo ${name} | sed s///g`
fi
}

build_drivers_tql() {
	tqlfile=$1

	testcase_list_drivers=($(ls -1p ${ZYNQ_BUILD_TESTS}/build_tests/drivers | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
	for testcase in "${testcase_list_drivers[@]}"; do
		echo "FROM \$RDI_DEMO_DIR/build_tests/drivers/${testcase}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_DRIVERS'," >> $tqlfile
		echo -e "\t\ttsuite = '`echo ${testcase} | awk '{print toupper($0)}'`'," >> $tqlfile
		fetch_name  ${ZYNQ_BUILD_TESTS}/build_tests/drivers/${testcase}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\tmodule = '${testcase}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_BUILD_TESTS}/build_tests/drivers/${testcase}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		echo -e "\t\tregression_type = 'sanity'," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		echo -e "\t\tmessagefile = '${BUILD_DIR}/drivers/msg.xml'" >> $tqlfile
		echo -e "\t}" >> $tqlfile
		echo "AS build_zynq_drivers_projects_${testcase};" >> $tqlfile
		echo -e "" >> $tqlfile
	done
}

build_fsbl_tql() {
	tqlfile=$1

	testcase_list_fsbl=($(ls -1p ${ZYNQ_BUILD_TESTS}/build_tests/fsbl | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
	for testcase in "${testcase_list_fsbl[@]}"; do
		echo "FROM \$RDI_DEMO_DIR/build_tests/fsbl/${testcase}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_FSBL'," >> $tqlfile
		echo -e "\t\ttsuite = '`echo ${testcase} | awk '{print toupper($0)}'`'," >> $tqlfile
		fetch_name  ${ZYNQ_BUILD_TESTS}/build_tests/fsbl/${testcase}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\tmodule = '${testcase}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_BUILD_TESTS}/build_tests/fsbl/${testcase}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		echo -e "\t\tregression_type = 'sanity'," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		echo -e "\t\tmessagefile = '${BUILD_DIR}/fsbl/msg.xml'" >> $tqlfile
		echo -e "\t}" >> $tqlfile
		echo "AS build_zynq_fsbl_projects_${testcase};" >> $tqlfile
		echo -e "" >> $tqlfile
	done
}

### generate tql files for build test cases ###
tqlfile=build_zynq.tql

echo "######## query for build zynq test cases #########" >> $tqlfile
echo -e "" >> $tqlfile
build_drivers_tql "$tqlfile"
build_fsbl_tql "$tqlfile"

chmod 755 $tqlfile
echo "done....thanks"
exit 0
