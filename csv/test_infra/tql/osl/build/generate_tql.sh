#!/bin/bash
#set -x

### Generating tql file for build test cases ###
count=`ls -1 *.tql 2>/dev/null | wc -l`
if [ $count != 0 ]; then
	rm -rf *.tql
fi

echo `pwd`
BUILD_DIR="${RDI_REPOSITORY}/build-scripts/osl/build"

echo "Generating tql files for zynqmp build tests: ${testcase_list[@]}"

build_zynqmp_tql() {
	tqlfile=$1

	testcase_list=(dc1 dc2 dc5 zcu102 zcu100 ep108 qemu common)

	for testcase in "${testcase_list[@]}"; do
		echo "FROM \$RDI_DEMO_DIR/build-scripts/osl/build/${testcase}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\ttsuite = 'build_projects_${testcase}'," >> $tqlfile
		echo -e "\t\tssuite = 'build'," >> $tqlfile
		echo -e "\t\tmodule = '${testcase}'," >> $tqlfile
		echo -e "\t\tboard = '${testcase}'," >> $tqlfile
		echo -e "\t\ttest_name = 'build_projects_${testcase}'," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		echo -e "\t\tname = 'build_zynqmp_projects_${testcase}'," >> $tqlfile
		echo -e "\t\tmessagefile = '${BUILD_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t}" >> $tqlfile
		echo "AS build_zynqmp_projects_${testcase};" >> $tqlfile
		echo -e "" >> $tqlfile
	done
}

build_hdf() {
        tqlfile=$1
        silicon=$2
        module=$3
	board=$4

        echo "FROM \$RDI_DEMO_DIR/tcRepo/osl/zynqMP/hardware/scripts/build/hdf/build_hdf/$module/$silicon/ddr_full" >> $tqlfile
        echo "TEMPLATE" >> $tqlfile
        echo -e "\t user { " >> $tqlfile
        echo -e "\t\t tsuite = 'build_hdf_${silicon}'," >> $tqlfile
        echo -e "\t\t ssuite = 'hdf'," >> $tqlfile
        echo -e "\t\t module = '$module'," >> $tqlfile
        echo -e "\t\t board = '$board'," >> $tqlfile
        echo -e "\t\t ddr = 'full'," >> $tqlfile
        echo -e "\t\t silicon = '$silicon'," >> $tqlfile
        echo -e "\t\t test_name = 'build_hdf_${silicon}_${module}'," >> $tqlfile
        echo -e "\t\t priority = '1'," >> $tqlfile
        echo -e "\t\t name = 'build_hdf_${silicon}_${module}'," >> $tqlfile
        echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
        echo -e "\t } " >> $tqlfile
        echo "AS build_hdf_${silicon}_${module};" >> $tqlfile
        echo -e " " >> $tqlfile

        echo "FROM \$RDI_DEMO_DIR/tcRepo/osl/zynqMP/hardware/scripts/build/hdf/build_hdf/$module/$silicon/ddr_less" >> $tqlfile
        echo "TEMPLATE" >> $tqlfile
        echo -e "\t user { " >> $tqlfile
        echo -e "\t\t tsuite = 'build_hdf_ddr_less_${silicon}'," >> $tqlfile
        echo -e "\t\t ssuite = 'hdf'," >> $tqlfile
        echo -e "\t\t module = '${module}'," >> $tqlfile
        echo -e "\t\t board = '$board'," >> $tqlfile
        echo -e "\t\t ddr = 'less'," >> $tqlfile
        echo -e "\t\t silicon = '$silicon'," >> $tqlfile
        echo -e "\t\t test_name = 'build_hdf_ddr_less_${silicon}_${module}'," >> $tqlfile
        echo -e "\t\t priority = '1'," >> $tqlfile
        echo -e "\t\t name = 'build_hdf_ddr_less_${silicon}_${module}'," >> $tqlfile
        echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
        echo -e "\t } " >> $tqlfile
        echo "AS build_hdf_ddr_less_${silicon}_${module};" >> $tqlfile
        echo -e " " >> $tqlfile
}

build_elf() {
	tqlfile=$1
	module=$2
	board=$3

	version=64
	count=0
	while [ $count -lt 2 ]; do
		echo The counter is $count
		let count=count+1
		echo "FROM \$RDI_DEMO_DIR/tcRepo/osl/zynqMP/hardware/scripts/build/fsbl/build_fsbl/${version}_bit" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = 'build_fsbl'," >> $tqlfile
		echo -e "\t\t ssuite = 'fsbl'," >> $tqlfile
		echo -e "\t\t module = '${module}'," >> $tqlfile
		echo -e "\t\t version = '${version}_bit'," >> $tqlfile
		echo -e "\t\t board = '${board}'," >> $tqlfile
		echo -e "\t\t test_name = 'build_fsbl_${version}'," >> $tqlfile
		echo -e "\t\t priority = '1'," >> $tqlfile
		echo -e "\t\t name = 'build_fsbl_${version}'," >> $tqlfile
		echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t } " >> $tqlfile
		echo "AS build_fsbl_${version};" >> $tqlfile
		echo -e " " >> $tqlfile

		echo "FROM \$RDI_DEMO_DIR/tcRepo/osl/zynqMP/hardware/scripts/build/fsbl_ddr_less/build_fsbl/${version}_bit" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = 'build_fsbl'," >> $tqlfile
		echo -e "\t\t ssuite = 'fsbl_ddr_less'," >> $tqlfile
		echo -e "\t\t module = '${module}'," >> $tqlfile
		echo -e "\t\t version = '${version}_bit'," >> $tqlfile
		echo -e "\t\t board = '${board}'," >> $tqlfile
		echo -e "\t\t test_name = 'build_fsbl_ddr_less_${version}'," >> $tqlfile
		echo -e "\t\t priority = '1'," >> $tqlfile
		echo -e "\t\t name = 'build_fsbl_ddr_less_${version}'," >> $tqlfile
		echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t } " >> $tqlfile
		echo "AS build_fsbl_ddr_less_${version};" >> $tqlfile
		echo -e " " >> $tqlfile
		version=32
	done
}

### generate tql files for build test cases ###
tqlfile=$RDI_REPOSITORY/tql/osl/build/build.tql

echo "######## query for build zynqmp test cases #########" >> $tqlfile
echo -e "" >> $tqlfile
build_zynqmp_tql "$tqlfile"

echo "######## query for build elf test cases #########" >> $tqlfile
echo -e "" >> $tqlfile

build_elf "$tqlfile" "zcu102" "zcu102"
build_elf "$tqlfile" "zcu100" "zcu100"
build_elf "$tqlfile" "dc1" "zc1751"
build_elf "$tqlfile" "dc2" "zc1751"
build_elf "$tqlfile" "dc5" "zc1751"

echo "######## query for build hdf test cases #########" >> $tqlfile
echo -e "" >> $tqlfile

build_hdf "$tqlfile" "da7-es1" "zcu102" "zcu102"
build_hdf "$tqlfile" "da10-es1" "zcu102" "zcu102"
build_hdf "$tqlfile" "da7-es2" "zcu102" "zcu102"
build_hdf "$tqlfile" "da7" "zcu102" "zcu102"

build_hdf "$tqlfile" "da2-a484-es1" "zcu100" "zcu100"
build_hdf "$tqlfile" "da2-a484" "zcu100" "zcu100"

build_hdf "$tqlfile" "da7-es1" "dc1" "zc1751"
build_hdf "$tqlfile" "da10-es1" "dc1" "zc1751"
build_hdf "$tqlfile" "da7-es2" "dc1" "zc1751"
build_hdf "$tqlfile" "da7" "dc1" "zc1751"

build_hdf "$tqlfile" "da7-es1" "dc3" "zc1751"
build_hdf "$tqlfile" "da10-es1" "dc3" "zc1751"
build_hdf "$tqlfile" "da7-es2" "dc3" "zc1751"
build_hdf "$tqlfile" "da7" "dc3" "zc1751"

build_hdf "$tqlfile" "da7-es1" "dc4" "zc1751"
build_hdf "$tqlfile" "da10-es1" "dc4" "zc1751"
build_hdf "$tqlfile" "da7-es2" "dc4" "zc1751"
build_hdf "$tqlfile" "da7" "dc4" "zc1751"

build_hdf "$tqlfile" "da7-es1" "dc2" "zc1751"
build_hdf "$tqlfile" "da10-es1" "dc2" "zc1751"
build_hdf "$tqlfile" "da7-es2" "dc2" "zc1751"
build_hdf "$tqlfile" "da7" "dc2" "zc1751"

build_hdf "$tqlfile" "da7-es1" "dc5" "zc1751"
build_hdf "$tqlfile" "da10-es1" "dc5" "zc1751"
build_hdf "$tqlfile" "da7-es2" "dc5" "zc1751"
build_hdf "$tqlfile" "da7" "dc5" "zc1751"

chmod 755 $tqlfile

echo "done....thanks"
exit 0
