#!/bin/bash

generate_common_tql() {
	tqlfile=$1
	run_dir=$2
	tsuite=$3
	ssuite=$4
	module=$5
	board=$6
	reg_type=$7
	reg_subtype=$8
	messagefile=$9
	repo_component=${10}
	name_prefix=${11}
	plnx_component=${12}
	variance=${13}

	common_tests="canps,cputest,dma,ethernet,gpio,hotplug,i2c,netboot,openAMP,rtc,sd,swdt,timer"
	dc1_tests="qspi,fpga_manager,sata"
	dc2_tests="usb,spi,nand,fpga_manager,sata"
	dc5_testst="qspi,usb,fpga_manager,sata"
	zcu102_tests="qspi,usb,fpga_manager,sata"
	zcu100_tests="qspi,usb,fpga_manager,sata"
	ac701_tests="qspi,usb"
	ep108_tests="qspi,usb"
	kc705_tests="qspi,usb"
	kcu105_tests="qspi,usb"
	zc702_tests="qspi,usb"
	zc706_tests="qspi,usb"
	zcu106_tests="qspi,usb"
	zed_tests="qspi,usb"

	TESTS=${DEMO_HOME}/tcRepo/common/tests/hardware/testscripts/*.sh

	echo -e " " >> $tqlfile

	for test_path in $TESTS
	do
		test_name=$(basename $test_path  | cut -f 1 -d '.')
		board_tests_mapping=${board}_tests

		if [[ ",${!board_tests_mapping}," == *",$test_name,"* || ",$common_tests," == *",$test_name,"* ]]; then

			echo "############### $test_name ################"  >> $tqlfile
			echo "FROM $run_dir" >> $tqlfile
			echo "TEMPLATE" >> $tqlfile
			echo -e "\t user { " >> $tqlfile
			echo -e "\t\t ssuite = '${ssuite}'," >> $tqlfile
			echo -e "\t\t test_name = '${test_name}'," >> $tqlfile
			if [ "$repo_component" == "petalinux" ]; then
				echo -e "\t\t component = '${plnx_component}'," >> $tqlfile
                                echo -e "\t\t variance = '${variance}'," >> $tqlfile
	                        echo -e "\t\t tsuite = '${test_name}'," >> $tqlfile
				echo -e "\t\t test_dir = 'kernel'," >> $tqlfile
			elif [ "$repo_component" == "osl" ]; then
				echo -e "\t\t module = '${module}'," >> $tqlfile
	                        echo -e "\t\t board = '${board}'," >> $tqlfile
	                        echo -e "\t\t tsuite = '${tsuite}'," >> $tqlfile
			fi
			echo -e "\t\t name = '${name_prefix}_${test_name}'," >> $tqlfile
			echo -e "\t\t priority = '1'," >> $tqlfile
			echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
			echo -e "\t\t reg_subtype = '${reg_subtype}'," >> $tqlfile
			echo -e "\t\t messagefile = '${messagefile}'," >> $tqlfile
			echo -e "\t\t category = 'common_tests'," >> $tqlfile
			echo -e "\t } " >> $tqlfile
			echo "AS ${name_prefix}_${test_name};" >> $tqlfile
			echo -e " " >> $tqlfile

		else
			continue;
		fi

	done

}
