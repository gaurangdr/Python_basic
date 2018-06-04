#!/bin/bash
#set -x

count=`ls -1 *.tql 2>/dev/null | wc -l`
if [ $count != 0 ]; then
	rm -rf *.tql
fi

source $RDI_REPOSITORY/common/env_var_global.sh osl zynqMP
source $RDI_REPOSITORY/tql/common/generate_tql.sh

echo $PWD

boot_linux_tql() {
	bifdir=$RDI_VNC_REPO/scripts/execute/boot_linux/bif
	component=$1
	reg_type=$2
	version=$3
	bootmode=$4
	tqlfile=$5

	echo "###### ${bootmode} boot mode #####" >> $tqlfile
	echo -e " " >> $tqlfile

	for biffile in $bifdir/*.bif ; do
	# Extract the test name before ".bif" and assign
		test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`

		if `echo "${test}.bif" | grep -q -e "_sd.bif"`; then
			continue
		fi

		echo "FROM \$OSL_DIR/zynqMP/hardware/scripts/execute/boot_linux/${bootmode}/zcu100/${version}_bit" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
		echo -e "\t\t ssuite = 'boot_linux'," >> $tqlfile
		echo -e "\t\t version = '${version}_bit'," >> $tqlfile
		echo -e "\t\t module = 'zcu100'," >> $tqlfile
		echo -e "\t\t board = 'zcu100'," >> $tqlfile
		echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
		echo -e "\t\t test_name = '${test}'," >> $tqlfile
		echo -e "\t\t priority = '1'," >> $tqlfile
#		echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
		echo -e "\t\t name = 'boot_linux_${bootmode}_${version}_${test}'," >> $tqlfile
		echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t } " >> $tqlfile
		echo "AS boot_linux_${bootmode}_${version}_${test};" >> $tqlfile
		echo -e " " >> $tqlfile
	done
}

boot_linux_secure_tql() {
	bifdir=$RDI_VNC_REPO/scripts/execute/boot_linux_secure/bif_secure
        component=$1
	reg_type=$2
	version=$3
	bootmode=$4
	tqlfile=$5

	echo "###### ${bootmode} boot mode #####" >> $tqlfile
	echo -e " " >> $tqlfile

	for biffile in $bifdir/*.bif ; do
	# Extract the test name before ".bif" and assign
		test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`

		if `echo "${test}.bif" | grep -q -e "_sd.bif"`; then
			continue
		fi

		echo "FROM \$OSL_DIR/zynqMP/hardware/scripts/execute/boot_linux_secure/${bootmode}/zcu100/${version}_bit" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
		echo -e "\t\t ssuite = 'boot_linux_secure'," >> $tqlfile
		echo -e "\t\t version = '${version}_bit'," >> $tqlfile
		echo -e "\t\t module = 'zcu100'," >> $tqlfile
		echo -e "\t\t board = 'zcu100'," >> $tqlfile
		echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
		echo -e "\t\t test_name = '${test}'," >> $tqlfile
		echo -e "\t\t priority = '1'," >> $tqlfile
#                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
		echo -e "\t\t name = 'boot_linux_secure_${bootmode}_${version}_${test}'," >> $tqlfile
		echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t } " >> $tqlfile
		echo "AS boot_linux_secure_${bootmode}_${version}_${test};" >> $tqlfile
		echo -e " " >> $tqlfile
	done
}

freertos_tql() {
	bifdir=$RDI_VNC_REPO/scripts/execute/freertos/bif
	reg_type=$1
	version=$2
	bootmode=$3
	tqlfile=$4

	echo "###### ${bootmode} boot mode #####" >> $tqlfile
	echo -e " " >> $tqlfile

	for biffile in $bifdir/*.bif ; do
	# Extract the test name before ".bif" and assign
		test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`
		biffile_name="${test}.bif"

		if `echo "${biffile_name}" | grep -q -e "_sd.bif"`; then
			continue
		fi

		if echo "${biffile_name}" | grep -q "_all.bif"; then
			export test_device="eg"
		elif echo "${biffile_name}" | grep -q "_cg.bif"; then
			export test_device="cg"
		else
			export test_device="$ZCU100_PS"
		fi

		echo "FROM \$OSL_DIR/zynqMP/hardware/scripts/execute/freertos/${bootmode}/zcu100/${version}_bit" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
		echo -e "\t\t ssuite = 'freertos'," >> $tqlfile
		echo -e "\t\t version = '${version}_bit'," >> $tqlfile
		echo -e "\t\t module = 'zcu100'," >> $tqlfile
		echo -e "\t\t board = 'zcu100'," >> $tqlfile
		echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
		echo -e "\t\t test_name = '${test}'," >> $tqlfile
		echo -e "\t\t test_device = '${test_device}'," >> $tqlfile
		echo -e "\t\t priority = '1'," >> $tqlfile
#                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
		echo -e "\t\t name = 'freertos_${bootmode}_${version}_${test}'," >> $tqlfile
		echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t } " >> $tqlfile
		echo "AS freertos_${bootmode}_${version}_${test};" >> $tqlfile
		echo -e " " >> $tqlfile
	done
}

linux_tql() {
        component=$1
	reg_type=$2
	tqlfile=$3
	test=$4
	test_type=$5

	if [ -z "${test_type}" ]; then
		test_type="driver_test"
	fi

        if [ "${test_type}" == "perf_test" ]; then
                reg_subtype="performance"
        else
                reg_subtype="functional"
        fi

	echo "FROM \$OSL_DIR/zynqMP/hardware/scripts/execute/linux/zcu100" >> $tqlfile
	echo "TEMPLATE" >> $tqlfile
	echo -e "\t user { " >> $tqlfile
	echo -e "\t\t tsuite = 'a53_linux'," >> $tqlfile
	echo -e "\t\t ssuite = 'linux'," >> $tqlfile
	echo -e "\t\t module = 'zcu100'," >> $tqlfile
	echo -e "\t\t board = 'zcu100'," >> $tqlfile
	echo -e "\t\t test_type = '${test_type}'," >> $tqlfile
	echo -e "\t\t test_name = '${test}'," >> $tqlfile
	echo -e "\t\t priority = '1'," >> $tqlfile
#        echo -e "\t\t component = '${component}'," >> $tqlfile
        echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
        echo -e "\t\t reg_subtype = '${reg_subtype}'," >> $tqlfile
	echo -e "\t\t name = 'linux_${test}'," >> $tqlfile
	echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
	echo -e "\t } " >> $tqlfile
	echo "AS linux_${test};" >> $tqlfile
	echo -e " " >> $tqlfile
}

uboot_tql() {
	component=$1
	reg_type=$2
	tqlfile=$3
	test=$4

	echo "FROM \$OSL_DIR/zynqMP/hardware/scripts/execute/uboot/zcu100" >> $tqlfile
	echo "TEMPLATE" >> $tqlfile
	echo -e "\t user { " >> $tqlfile
	echo -e "\t\t tsuite = 'a53_uboot'," >> $tqlfile
	echo -e "\t\t ssuite = 'uboot'," >> $tqlfile
	echo -e "\t\t module = 'zcu100'," >> $tqlfile
	echo -e "\t\t board = 'zcu100'," >> $tqlfile
	echo -e "\t\t test_name = '${test}'," >> $tqlfile
	echo -e "\t\t priority = '1'," >> $tqlfile
#        echo -e "\t\t component = '${component}'," >> $tqlfile
        echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
	echo -e "\t\t name = 'uboot_${test}'," >> $tqlfile
	echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
	echo -e "\t } " >> $tqlfile
	echo "AS uboot_${test};" >> $tqlfile
	echo -e " " >> $tqlfile
}

zcu100_tql() {
	component=$1
	reg_type=$2
	tqlfile=$3
	test=$4
	tsuite=$5
	ssuite=$6

	echo "FROM \$OSL_DIR/zynqMP/hardware/scripts/execute/$ssuite/zcu100" >> $tqlfile
	echo "TEMPLATE" >> $tqlfile
	echo -e "\t user { " >> $tqlfile
	echo -e "\t\t tsuite = '$tsuite'," >> $tqlfile
	echo -e "\t\t ssuite = '$ssuite'," >> $tqlfile
	echo -e "\t\t module = 'zcu100'," >> $tqlfile
	echo -e "\t\t board = 'zcu100'," >> $tqlfile
	echo -e "\t\t test_name = '${test}'," >> $tqlfile
	echo -e "\t\t priority = '1'," >> $tqlfile
#        echo -e "\t\t component = '${component}'," >> $tqlfile
        echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
	if [ $test == "xen" ]; then
		echo -e "\t\t name = '${test}'," >> $tqlfile
	else
		echo -e "\t\t name = '${ssuite}_${test}'," >> $tqlfile
	fi
	echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
	echo -e "\t } " >> $tqlfile
	if [ $test == "xen" ]; then
		echo "AS ${test};" >> $tqlfile
	else
		echo "AS ${ssuite}_${test};" >> $tqlfile
	fi
	echo -e " " >> $tqlfile
}

### Generating tql file for boot linux test cases ###

tqlfile=boot_linux.tql
echo "######### Query for Boot Linux test cases for zcu100 module ##############" >> $tqlfile
echo -e " " >> $tqlfile

echo "######## query for boot_linux_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

boot_linux_tql "osl" "weekly" "64" "sd0" "$tqlfile"

#echo "######## query for boot_linux_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#boot_linux_tql "osl" "weekly" "32" "sd0" "$tqlfile"

chmod 755 $tqlfile

### Generating tql file for boot linux secure test cases ###

tqlfile=boot_linux.tql
echo "######### Query for Boot Linux secure test cases for zcu100 module ##############" >> $tqlfile
echo -e " " >> $tqlfile

echo "######## query for boot_linux_secure_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

boot_linux_secure_tql "osl" "weekly" "64" "sd0" "$tqlfile"

#echo "######## query for boot_linux_secure_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#boot_linux_secure_tql "osl" "weekly" "32" "sd0" "$tqlfile"

chmod 755 $tqlfile

### Generating tql file for freertos test cases ###

tqlfile=freertos.tql
echo "######### Query for Freertos test cases for zcu100 module ##############" >> $tqlfile
echo -e " " >> $tqlfile

echo "######## query for freertos_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

freertos_tql "weekly" "64" "sd0" "$tqlfile"

#echo "######## query for freertos_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#freertos_tql "weekly" "32" "sd0" "$tqlfile"

chmod 755 $tqlfile

### Generating tql file for Linux test cases ###

tqlfile=linux.tql

echo "######## query for Linux test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

linux_tql "osl" "sanity,daily" "$tqlfile" "usb_host"
linux_tql "osl" "weekly" "$tqlfile" "usb_host_perf" "perf_test"
linux_tql "osl" "sanity,daily" "$tqlfile" "i2c_eeprom"
linux_tql "osl" "weekly" "$tqlfile" "sd_perf" "perf_test"
#linux_tql "osl" "sanity,daily" "$tqlfile" "sd"
linux_tql "osl" "sanity,daily" "$tqlfile" "smp"
#linux_tql "osl" "sanity,daily" "$tqlfile" "rtc"
#linux_tql "osl" "sanity,daily" "$tqlfile" "dma"
linux_tql "osl" "sanity,daily" "$tqlfile" "sd_ext2"
linux_tql "osl" "sanity,daily" "$tqlfile" "sd_ext3"
linux_tql "osl" "sanity,daily" "$tqlfile" "sd_ext4"
linux_tql "osl" "weekly" "$tqlfile" "sd_fio" "perf_test"
linux_tql "osl" "weekly" "$tqlfile" "usb_fio" "perf_test"

generate_common_tql "$tqlfile" "\$OSL_DIR/zynqMP/hardware/scripts/execute/linux/zcu100" "a53_linux" "linux" "zcu100" "zcu100" "sanity,daily" "sanity,functional,performance,stress" "${COMMON_DIR}/msg.xml" "osl" "linux"

chmod 755 $tqlfile

### Generating tql file for U-Boot test cases ###

tqlfile=uboot.tql

echo "######## query for U-Boot test cases #########" >> $tqlfile
echo -e "" >> $tqlfile

uboot_tql "osl" "weekly" "$tqlfile" "sd_info"
uboot_tql "osl" "weekly" "$tqlfile" "sd_find_string"
uboot_tql "osl" "weekly" "$tqlfile" "sd_read"
uboot_tql "osl" "weekly" "$tqlfile" "sd_write"

chmod 755 $tqlfile

### Generating tql file for Open AMP test cases ###

tqlfile=zcu100.tql

echo "######### Query for Open AMP test cases for zcu100 module ##########" >> $tqlfile
echo -e " " >> $tqlfile

zcu100_tql "osl" "weekly" "$tqlfile" "echo_test" "openamp_example_apps" "openamp"
zcu100_tql "osl" "weekly" "$tqlfile" "mat_mul_demo" "openamp_example_apps" "openamp"
zcu100_tql "osl" "weekly" "$tqlfile" "proxy_app" "openamp_example_apps" "openamp"

echo "######### Query for PMU Firmware test cases for zcu100 module ##########" >> $tqlfile
echo -e " " >> $tqlfile

zcu100_tql "osl" "weekly" "$tqlfile" "linux_cpu_hotplug" "pmu_fw_examples" "pmu_fw"

echo "######### Query for Xen test cases for zcu100 module ##########" >> $tqlfile
echo -e " " >> $tqlfile

zcu100_tql "osl" "weekly" "$tqlfile" "xen" "xen_hw" "xen"

chmod 755 $tqlfile

echo "done....thanks"
exit 0
