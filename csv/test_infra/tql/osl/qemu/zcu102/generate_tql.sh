#!/bin/bash
#set -x

count=`ls -1 *.tql 2>/dev/null | wc -l`
if [ $count != 0 ]; then
	rm -rf *.tql
fi

source $RDI_REPOSITORY/common/env_var_global.sh osl zynqMP
echo $PWD

boot_linux_tql() {
	bifdir=$RDI_REPOSITORY/tcRepo/osl/zynqMP/qemu/scripts/boot_linux/bif
	component=$1
	reg_type=$2
	bootmode=$3
	tqlfile=$4

	echo "###### ${bootmode} boot mode #####" >> $tqlfile
	echo -e " " >> $tqlfile

	for biffile in $bifdir/*.bif ; do
	# Extract the test name before ".bif" and assign
		test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`

		echo "FROM \$OSL_DIR/zynqMP/qemu/scripts/boot_linux/${bootmode}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
		echo -e "\t\t ssuite = 'boot_linux'," >> $tqlfile
		echo -e "\t\t module = 'zcu102'," >> $tqlfile
		echo -e "\t\t board = 'zcu102'," >> $tqlfile
		echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
		echo -e "\t\t test_name = '${test}'," >> $tqlfile
		echo -e "\t\t priority = '1'," >> $tqlfile
                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
		echo -e "\t\t name = 'boot_linux_${bootmode}_${test}'," >> $tqlfile
		echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t } " >> $tqlfile
		echo "AS boot_linux_${bootmode}_${test};" >> $tqlfile
		echo -e " " >> $tqlfile
	done
}

freertos_tql() {
	bifdir=$RDI_REPOSITORY/tcRepo/osl/zynqMP/qemu/scripts/freertos/bif
	component=$1
	reg_type=$2
	bootmode=$3
	tqlfile=$4

	echo "###### ${bootmode} boot mode #####" >> $tqlfile
	echo -e " " >> $tqlfile

	for biffile in $bifdir/*.bif ; do
	# Extract the test name before ".bif" and assign
		test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`

		if `echo "${test}.bif" | grep -q -e "_sd.bif"`; then
			continue
		fi
                
		if [[ "$test" == "boota53_freertos" || "$test" == "boota53_freertosl" || "$test" == "bootr5_freertos" || "$test" == "bootr5_freertosl" ]]; then
                        component=osl
                else
                        component=standalone
                fi
		echo "FROM \$OSL_DIR/zynqMP/qemu/scripts/freertos/${bootmode}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
		echo -e "\t\t ssuite = 'freertos'," >> $tqlfile
		echo -e "\t\t module = 'zcu102'," >> $tqlfile
		echo -e "\t\t board = 'zcu102'," >> $tqlfile
		echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
		echo -e "\t\t test_name = '${test}'," >> $tqlfile
		echo -e "\t\t priority = '1'," >> $tqlfile
                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
		echo -e "\t\t name = 'freertos_${bootmode}_${test}'," >> $tqlfile
		echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
		echo -e "\t } " >> $tqlfile
		echo "AS freertos_${bootmode}_${test};" >> $tqlfile
		echo -e " " >> $tqlfile
	done
}

uboot_tql() {
	component=$1
	reg_type=$2
	tqlfile=$3
	test=$4

	echo "FROM \$OSL_DIR/zynqMP/qemu/scripts/uboot" >> $tqlfile
	echo "TEMPLATE" >> $tqlfile
	echo -e "\t user { " >> $tqlfile
	echo -e "\t\t tsuite = 'a53_uboot'," >> $tqlfile
	echo -e "\t\t ssuite = 'uboot'," >> $tqlfile
	echo -e "\t\t module = 'zcu102'," >> $tqlfile
	echo -e "\t\t board = 'zcu102'," >> $tqlfile
	echo -e "\t\t test_name = 'uboot_${test}'," >> $tqlfile
	echo -e "\t\t priority = '1'," >> $tqlfile
        echo -e "\t\t component = '${component}'," >> $tqlfile
        echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
	echo -e "\t\t name = 'uboot_${test}'," >> $tqlfile
	echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
	echo -e "\t } " >> $tqlfile
	echo "AS uboot_${test};" >> $tqlfile
	echo -e " " >> $tqlfile
}

kernel_tql() {
	component=$1
	reg_type=$2
	tqlfile=$3
	test=$4

	echo "FROM \$OSL_DIR/zynqMP/qemu/scripts/kernel" >> $tqlfile
	echo "TEMPLATE" >> $tqlfile
	echo -e "\t user { " >> $tqlfile
	echo -e "\t\t tsuite = 'a53_kernel'," >> $tqlfile
	echo -e "\t\t ssuite = 'kernel'," >> $tqlfile
	echo -e "\t\t module = 'zcu102'," >> $tqlfile
	echo -e "\t\t board = 'zcu102'," >> $tqlfile
	echo -e "\t\t test_name = '${test}'," >> $tqlfile
	echo -e "\t\t priority = '1'," >> $tqlfile
        echo -e "\t\t component = '${component}'," >> $tqlfile
        echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
	echo -e "\t\t name = 'kernel'," >> $tqlfile
	echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
	echo -e "\t } " >> $tqlfile
	echo "AS kernel;" >> $tqlfile
	echo -e " " >> $tqlfile
}

openamp_tql() {
	component=$1
	reg_type=$2
	tqlfile=$3
	test=$4

	echo "FROM \$OSL_DIR/zynqMP/qemu/scripts/openamp" >> $tqlfile
	echo "TEMPLATE" >> $tqlfile
	echo -e "\t user { " >> $tqlfile
	echo -e "\t\t tsuite = 'a53_openamp'," >> $tqlfile
	echo -e "\t\t ssuite = 'openamp'," >> $tqlfile
	echo -e "\t\t module = 'zcu102'," >> $tqlfile
	echo -e "\t\t board = 'zcu102'," >> $tqlfile
	echo -e "\t\t test_name = 'openamp_${test}'," >> $tqlfile
	echo -e "\t\t priority = '1'," >> $tqlfile
        echo -e "\t\t component = '${component}'," >> $tqlfile
        echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
	echo -e "\t\t name = 'openamp_${test}'," >> $tqlfile
	echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
	echo -e "\t } " >> $tqlfile
	echo "AS openamp_${test};" >> $tqlfile
	echo -e " " >> $tqlfile
}

pmu_fw_tql() {
	component=$1
	reg_type=$2
	tqlfile=$3
	test=$4

	echo "FROM \$OSL_DIR/zynqMP/qemu/scripts/pmu_fw" >> $tqlfile
	echo "TEMPLATE" >> $tqlfile
	echo -e "\t user { " >> $tqlfile
	echo -e "\t\t tsuite = 'a53_pmu_fw'," >> $tqlfile
	echo -e "\t\t ssuite = 'pmu_fw'," >> $tqlfile
	echo -e "\t\t module = 'zcu102'," >> $tqlfile
	echo -e "\t\t board = 'zcu102'," >> $tqlfile
	echo -e "\t\t test_name = 'pmu_fw_${test}'," >> $tqlfile
	echo -e "\t\t priority = '1'," >> $tqlfile
        echo -e "\t\t component = '${component}'," >> $tqlfile
        echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
	echo -e "\t\t name = 'pmu_fw_${test}'," >> $tqlfile
	echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
	echo -e "\t } " >> $tqlfile
	echo "AS pmu_fw_${test};" >> $tqlfile
	echo -e " " >> $tqlfile
}

#### Generating tql file for boot linux test cases ###

tqlfile=boot_linux.tql
echo "######### Query for Boot Linux test cases ##############" >> $tqlfile
echo -e " " >> $tqlfile

echo "######## query for boot_linux test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

boot_linux_tql "osl" "sanity,daily" "qspi32" "$tqlfile"
boot_linux_tql "osl" "sanity,daily" "qspi24" "$tqlfile"
boot_linux_tql "osl" "sanity,daily" "sd1" "$tqlfile"

chmod 755 $tqlfile

### Generating tql file for freertos test cases ###

tqlfile=freertos.tql
echo "######### Query for Freertos test cases ##############" >> $tqlfile
echo -e " " >> $tqlfile

echo "######## query for freertos test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

freertos_tql "osl" "sanity,daily" "qspi32" "$tqlfile"
freertos_tql "osl" "sanity,daily" "qspi24" "$tqlfile"
freertos_tql "osl" "sanity,daily" "sd1" "$tqlfile"

chmod 755 $tqlfile

### Generating tql file for uboot test cases ###

tqlfile=uboot.tql

echo "######## query for U-Boot test cases #########" >> $tqlfile
echo -e "" >> $tqlfile

uboot_tql "osl" "sanity,daily" "$tqlfile" "ping"
uboot_tql "osl" "sanity,daily" "$tqlfile" "sd_info"
uboot_tql "osl" "sanity,daily" "$tqlfile" "tftp"
uboot_tql "osl" "sanity,daily" "$tqlfile" "dhcp"
uboot_tql "osl" "sanity,daily" "$tqlfile" "sd_find_string"
uboot_tql "osl" "sanity,daily" "$tqlfile" "sd_read"
uboot_tql "osl" "sanity,daily" "$tqlfile" "sd_write"
uboot_tql "osl" "sanity,daily" "$tqlfile" "qspi_s_boot_file"
uboot_tql "osl" "sanity,daily" "$tqlfile" "qspi_s_erase"
uboot_tql "osl" "sanity,daily" "$tqlfile" "qspi_s_write"
uboot_tql "osl" "sanity,daily" "$tqlfile" "qspi_s_read"
uboot_tql "osl" "sanity,daily" "$tqlfile" "netboot"
uboot_tql "osl" "sanity,daily" "$tqlfile" "pytest"

chmod 755 $tqlfile

#### Generating tql file for kernel test cases ###

tqlfile=kernel.tql

echo "######## query for kernel test cases #########" >> $tqlfile
echo -e "" >> $tqlfile

kernel_tql "osl" "sanity,daily" "$tqlfile" "kernel"

chmod 755 $tqlfile

### Generating tql file for Open AMP test cases ###

tqlfile=openamp.tql

echo "######### Query for Open AMP test cases ##########" >> $tqlfile
echo -e " " >> $tqlfile

openamp_tql "osl" "sanity,daily" "$tqlfile" "echo_test" 
openamp_tql "osl" "sanity,daily" "$tqlfile" "mat_mul_demo" 
openamp_tql "osl" "sanity,daily" "$tqlfile" "proxy_app" 

chmod 755 $tqlfile

### Generating tql file for pmu_fw test cases ###

tqlfile=pmu_fw.tql

echo "######### Query for PMU Firmware test cases ##########" >> $tqlfile
echo -e " " >> $tqlfile

pmu_fw_tql "standalone" "sanity,daily" "$tqlfile" "xilpm_a53" 
pmu_fw_tql "standalone" "sanity,daily" "$tqlfile" "xilpm_r5" 
pmu_fw_tql "osl" "sanity,daily" "$tqlfile" "linux_cpu_hotplug"

chmod 755 $tqlfile

echo "done....thanks"
exit 0
