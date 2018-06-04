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

		echo "FROM \$OSL_DIR/zynqMP/hardware/scripts/execute/boot_linux/${bootmode}/dc5/${version}_bit" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
		echo -e "\t\t ssuite = 'boot_linux'," >> $tqlfile
		echo -e "\t\t version = '${version}_bit'," >> $tqlfile
		echo -e "\t\t module = 'dc5'," >> $tqlfile
		echo -e "\t\t board = 'zc1751'," >> $tqlfile
		echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
		echo -e "\t\t test_name = '${test}'," >> $tqlfile
		echo -e "\t\t priority = '1'," >> $tqlfile
#                echo -e "\t\t component = '${component}'," >> $tqlfile
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
		biffile_name="${test}.bif"

		if echo "${biffile_name}" | grep -q -e "auth_" -e "enc_" -e "_sd.bif"; then
			continue
		fi

		echo "FROM \$OSL_DIR/zynqMP/hardware/scripts/execute/boot_linux_secure/${bootmode}/dc5/${version}_bit" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\t user { " >> $tqlfile
		echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
		echo -e "\t\t ssuite = 'boot_linux_secure'," >> $tqlfile
		echo -e "\t\t version = '${version}_bit'," >> $tqlfile
		echo -e "\t\t module = 'dc5'," >> $tqlfile
		echo -e "\t\t board = 'zc1751'," >> $tqlfile
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

### Generating tql file for boot linux test cases ###

tqlfile=boot_linux.tql
echo "######### Query for Boot Linux test cases for dc5 module ##############" >> $tqlfile
echo -e " " >> $tqlfile

echo "######## query for boot_linux_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

boot_linux_tql "osl" "sanity,daily" "64" "sd0" "$tqlfile"

#echo "######## query for boot_linux_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#boot_linux_tql "osl" "sanity,daily" "32" "sd0" "$tqlfile"

chmod 755 $tqlfile

### Generating tql file for boot linux secure test cases ###

tqlfile=boot_linux.tql
echo "######### Query for Boot Linux secure test cases for dc5 module ##############" >> $tqlfile
echo -e " " >> $tqlfile

echo "######## query for boot_linux_secure_64 test cases #########" >> $tqlfile
echo -e " " >> $tqlfile

boot_linux_secure_tql "osl" "sanity,daily" "64" "sd0" "$tqlfile"

#echo "######## query for boot_linux_secure_32 test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#boot_linux_secure_tql "osl" "sanity,daily" "32" "sd0" "$tqlfile"

chmod 755 $tqlfile

### Generating tql file for Linux test cases ###

#tqlfile=linux.tql
#
#echo "######## query for Linux test cases #########" >> $tqlfile
#echo -e " " >> $tqlfile
#
#generate_common_tql "$tqlfile" "\$OSL_DIR/zynqMP/hardware/scripts/execute/linux/dc5" "a53_linux" "linux" "dc5" "zc1751" "sanity,daily" "sanity,functional,performance,stress" "${COMMON_DIR}/msg.xml" "osl" "linux"
#
#chmod 755 $tqlfile

echo "done....thanks"
exit 0
