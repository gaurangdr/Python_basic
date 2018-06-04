#!/bin/bash

### Generating tql file for zynq build test cases ###
#count=`ls -1 zc*/*.tql 2>/dev/null | wc -l`
#if [ $count != 0 ]; then
#	rm -rf zc*/*.tql
#fi

ls | grep -v generate_tql.sh | xargs rm -rf
### Below is the list of array mapping boards with test cases
##### Linux Modules
linux_zc702+=(GPIO GPIO_RECONFIGBIT I2C_EEPROM JTAG_ZC702 NFS QSPI SD_FAT32 SMP SUSPEND_ZC702 SWDT USB_HOST cross_over_qspi)
linux_zc706+=(JTAG_ZC706 QSPI_DUAL SUSPEND_ZC706)
linux_zc770_dc1+=(SPI JTAG_ZC770_XM010)
linux_zc770_dc2_x8+=(JTAG_ZC770_XM011_8BIT)
linux_zc770_dc2_x16+=(JTAG_ZC770_XM011_16BIT NAND)
linux_zc770_dc3+=(JTAG_ZC770_XM012 NOR)
linux_zc770_dc4+=(JTAG_ZC770_XM013)
linux_zed+=(SUSPEND_ZED JTAG_ZED)

##### Perf Linux Modules
perflinux_zc702+=(DHRYSTONE DMA_PERF I2C_PERF IPERF_CLIENT MIBENCH NETPERF_CLIENT_TCP NETPERF_CLIENT_UDP NETPERF_SERVER_TCP NETPERF_SERVER_UDP PARANOIA QSPI_SINGLE_PERF SD_IOZONE SD_PERF USB_DEVICE_PERF USB_IOZONE USB_PERF WHETSTONE sdk_dhrystone)
perflinux_zc706+=(QSPI_DUAL_PERF)
perflinux_zc770_dc1+=(SPI_PERF SPI)
perflinux_zc770_dc2_x16+=(NAND_PERF)
perflinux_zc770_dc3+=(NOR_PERF)

##### RSA Modules
rsa_zc702+=(efsbl_a_uboot_a_linux fsbl_a_uboot_a_linux fsbl_a_uboot_linux fsbl_ae_size_hello fsbl_ae_uboot_ae_linux fsbl_uboot_linux fsbl_ae_bit_a_hello fsbl_ae_bit_ae_hello fsbl_ae_hello fsbl_fallback fsbl_md5_ae_uboot_ae_linux qspi_secure_fallback fsbl_owner_uboot_linux fsbl_owner_uboot_linux_aes sd_fsbl_a_uboot_a_linux sd_fsbl_ae_uboot_ae_linux fsbl_owner_uboot_linux fsbl_owner_uboot_linux_aes sd_fsbl_owner_uboot_linux sd_fsbl_owner_uboot_linux_aes)

##### System Modules
system_zc702+=(QSPI_ZC702_uboot_linux QSPI_ZC702_uboot_linux_monolithic QSPI_bitstream_uboot_linux MD5_QSPI_ZC702_secure_bbram_uboot_linux QSPI_ZC702_secure_bbram_uboot_linux QSPI_ZC702_secure_efuse_uboot_linux SD_ZC702_uboot_linux SD_ZC702_secure_bbram_uboot_linux SD_ZC702_secure_efuse_uboot_linux MD5_QSPI_ZC702_uboot_linux MD5_SD_ZC702_uboot_linux)
system_zc702_ecc+=(QSPI_ZC702_ECC_uboot_linux SD_ZC702_ECC_uboot_linux)
system_zc706+=(QSPI_ZC706_uboot_linux QSPI_ZC706_uboot_linux_monolithic MD5_QSPI_ZC706_uboot_linux MD5_QSPI_ZC706_secure_bbram_uboot_linux SD_ZC706_uboot_linux MD5_SD_ZC706_uboot_linux SD_ZC706_secure_bbram_uboot_linux SD_ZC706_secure_efuse_uboot_linux)
system_zc706_ecc+=(SD_ZC706_ECC_uboot_linux QSPI_ZC706_ECC_uboot_linux)
system_zc770_dc2_x8+=(NANDx8_uboot_linux NANDx8_uboot_linux_monolithic NANDx8_uboot_linux_secure_bbram NANDx8_uboot_linux_secure_efuse)
system_zc770_dc2_x16+=(NANDx16_uboot_linux NANDx16_uboot_linux_monolithic)
system_zc770_dc3+=(NOR_uboot_linux)

###### UBOOT Modules
uboot_zc702+=(JTAG_ZC702_DEVCFG JTAG_ZC702_IIC_0x54 JTAG_ZC702_IIC_0x55 JTAG_ZC702_IIC_0x56 JTAG_ZC702_IIC_0x57 JTAG_ZC702 NONFSBL_UBOOT_ZC702 zc702 QSPI_ZC702 SD_ZC702)
uboot_zc702_ecc+=(JTAG_ZC702_ECC)
uboot_zc702_eusb_board+=(USB_ZC702)
uboot_zc702_usb_board+=(USB_ZC702)
uboot_zc706+=(JTAG_ZC706_DEVCFG JTAG_ZC706 NONFSBL_UBOOT_ZC706 zc706 QSPI_ZC706 SD_ZC706)
uboot_zc706_ecc+=(JTAG_ZC706_ECC QSPI_ZC706_ECC)
uboot_zc706_stack+=(JTAG_ZC706_STACK QSPI_ZC706_STACK)
uboot_zc706_usb_board+=(USB_ZC706)
uboot_zc770_dc1+=(JTAG_ZC770_XM010 QSPI_ZC770_XM010 SD_ZC770_XM010)
uboot_zc770_dc2_x8+=(JTAG_ZC770_XM011_8BIT NAND_ZC770_XM011_8BIT NONFSBL_UBOOT_ZC770_XM011_8BIT)
uboot_zc770_dc2_x16+=(JTAG_ZC770_XM011_16BIT NAND_ZC770_XM011_16BIT)
uboot_zc770_dc3+=(JTAG_ZC770_XM012 NOR_ZC770_XM012 NONFSBL_UBOOT_ZC770_XM012)
uboot_zc770_dc4+=(JTAG_ZC770_XM013 QSPI_ZC770_XM013)
uboot_eMMC_board+=(eMMC_ZC702)
uboot_eMMC_board_zc706+=(eMMC_ZC706)
uboot_qSPI_ZC702_ENV+=(QSPI_ZC702_ENV)

##### UBOOT RSA Modules
ubootrsa_zc702+=(fsbl_owner_uboot_linux fsbl_owner_uboot_linux_aes fsbl_owner_uboot_linux fsbl_owner_uboot_linux_aes sd_fsbl_owner_uboot_linux sd_fsbl_owner_uboot_linux_aes)

##### Flash Utility Modules
flashutility_zc702+=(MD5_QSPI_ZC702_uboot_linux QSPI_ZC702_uboot_linux QSPI_ZC702_uboot_linux QSPI_ZC702_uboot_linux QSPI_ZC702_uboot_linux_monolithic)
flashutility_zc706+=(QSPI_ZC706_uboot_linux QSPI_ZC706_uboot_linux_monolithic QSPI_ZC706_uboot_linux QSPI_ZC706_uboot_linux_monolithic MD5_QSPI_ZC706_uboot_linux)
flashutility_zc706_stack+=(QSPI_ZC706_stack_uboot_linux)
flashutility_zc770_dc2_x8+=(NANDx8_uboot_linux NANDx8_uboot_linux_monolithic NANDx8_uboot_linux NANDx8_uboot_linux_monolithic)
flashutility_zc770_dc2_x16+=(NANDx16_uboot_linux)
flashutility_zc770_dc3+=(NOR_uboot_linux)

##### FSBL Modules
fsbl_microzed+=(git-microzed:jtag_peripheral microzed:jtag_hello microzed:jtag_hello microzed:jtag_memory microzed:jtag_peripheral microzed:jtag_uboot)
fsbl_zc702+=(git-zc702:16MB_offset_uboot git-zc702:bitstream_uboot git-zc702:jtag_peripheral zc702-ecc:jtag_hello zc702-ecc:jtag_peripheral zc702:16MB_offset_uboot zc702:bbram_bitstream_uboot zc702:bbram_uboot zc702:bitstream_uboot zc702:efuse_bitstream_uboot zc702:efuse_hello zc702:efuse_md5_hello zc702:efuse_peripheral zc702:efuse_size_hello zc702:efuse_uboot zc702:fallback_offset_uboot zc702:fallback_secure_offset_uboot zc702:fallback_secure_uboot zc702:fallback_uboot zc702:hello zc702:jtag_hello zc702:jtag_memory zc702:jtag_peripheral zc702:jtag_uboot zc702:md5_hello zc702:peripheral zc702:sd_bbram_uboot zc702:sd_bbram_uboot zc702:sd_bitstream_uboot zc702:sd_bitstream_uboot zc702:sd_hello zc702:sd_hello zc702:sd_uboot zc702:sd_uboot zc702:uboot zc706-stack:md5_hello zc706-stack:peripheral zc706-stack:sd_bbram_uboot zc706-stack:sd_bitstream_uboot zc706-stack:sd_hello zc706-stack:sd_uboot zc706-stack:fallback_offset_uboot zc706-stack:fallback_secure_offset_uboot zc706-stack:fallback_secure_uboot zc706-stack:fallback_uboot)
fsbl_zc706+=(git-zc706:jtag_memory git-zc706:efuse_uboot git-zc706:jtag_peripheral git-zc706:sd_16MB_offset_uboot zc706:16MB_offset_uboot zc706:bbram_bitstream_uboot zc706:bbram_uboot zc706:bitstream_uboot zc706:efuse_bitstream_uboot zc706:efuse_hello zc706:efuse_peripheral zc706:efuse_uboot zc706:hello zc706:jtag_dhrystone zc706:jtag_hello zc706:jtag_memory zc706:jtag_peripheral zc706:jtag_peripheral zc706:jtag_uboot zc706:md5_uboot zc706:peripheral zc706:sd_16MB_offset_uboot zc706:sd_bitstream_uboot zc706:sd_hello zc706:sd_uboot zc706:uboot)
fsbl_zed+=(git-zed:jtag_peripheral zed:jtag_hello zed:jtag_memory zed:jtag_peripheral zed:jtag_uboot)
fsbl_zc702_ecc+=(zc702-ecc:bitstream_uboot zc702-ecc:efuse_hello zc702-ecc:efuse_peripheral zc702-ecc:efuse_uboot zc702-ecc:fallback_secure_uboot zc702-ecc:fallback_uboot zc702-ecc:hello zc702-ecc:jtag_memory zc702-ecc:jtag_peripheral zc702-ecc:jtag_uboot zc702-ecc:peripheral zc702-ecc:uboot)
fsbl_zc706_ecc+=(zc706-ecc:bitstream_uboot zc706-ecc:efuse_bitstream_uboot zc706-ecc:efuse_hello zc706-ecc:efuse_uboot zc706-ecc:hello zc706-ecc:jtag_hello zc706-ecc:jtag_memory zc706-ecc:jtag_peripheral zc706-ecc:jtag_peripheral zc706-ecc:jtag_uboot zc706-ecc:peripheral zc706-ecc:uboot)
fsbl_zc706_stack+=(zc706-stack:bbram_bitstream_uboot zc706-stack:bbram_uboot zc706-stack:bitstream_uboot zc706-stack:efuse_hello zc706-stack:hello zc706-stack:uboot)
fsbl_zc770_dc1+=(zc770-dc1:bbram_bitstream_uboot zc770-dc1:bbram_uboot zc770-dc1:bitstream_uboot zc770-dc1:efuse_bitstream_uboot zc770-dc1:efuse_hello zc770-dc1:efuse_peripheral zc770-dc1:efuse_uboot zc770-dc1:hello zc770-dc1:jtag_hello zc770-dc1:jtag_memory zc770-dc1:jtag_peripheral zc770-dc1:jtag_peripheral zc770-dc1:jtag_uboot zc770-dc1:peripheral zc770-dc1:uboot)
fsbl_zc770_dc2_x16+=(zc770-dc2-x16:bbram_bitstream_uboot zc770-dc2-x16:bbram_uboot zc770-dc2-x16:bitstream_uboot zc770-dc2-x16:efuse_bitstream_uboot zc770-dc2-x16:efuse_uboot zc770-dc2-x16:hello zc770-dc2-x16:jtag_hello zc770-dc2-x16:jtag_memory zc770-dc2-x16:jtag_peripheral zc770-dc2-x16:jtag_uboot zc770-dc2-x16:peripheral zc770-dc2-x16:uboot)
fsbl_zc770_dc2_x8+=(zc770-dc2-x8:bbram_bitstream_uboot zc770-dc2-x8:bbram_uboot zc770-dc2-x8:bitstream_uboot zc770-dc2-x8:efuse_bitstream_uboot zc770-dc2-x8:efuse_hello zc770-dc2-x8:efuse_peripheral zc770-dc2-x8:efuse_uboot zc770-dc2-x8:hello zc770-dc2-x8:jtag_hello zc770-dc2-x8:jtag_memory zc770-dc2-x8:jtag_peripheral zc770-dc2-x8:jtag_uboot zc770-dc2-x8:peripheral zc770-dc2-x8:uboot)
fsbl_zc770_dc3+=(zc770-dc3:bbram_bitstream_uboot zc770-dc3:bbram_uboot zc770-dc3:bitstream_uboot zc770-dc3:efuse_bitstream_uboot zc770-dc3:efuse_hello zc770-dc3:efuse_peripheral zc770-dc3:efuse_uboot zc770-dc3:hello zc770-dc3:jtag_hello zc770-dc3:jtag_memory zc770-dc3:jtag_peripheral zc770-dc3:jtag_uboot zc770-dc3:peripheral zc770-dc3:uboot)
fsbl_zc770_dc4+=(zc770-dc4:bbram_bitstream_uboot zc770-dc4:bbram_uboot zc770-dc4:bitstream_uboot zc770-dc4:efuse_bitstream_uboot zc770-dc4:efuse_hello zc770-dc4:efuse_peripheral zc770-dc4:efuse_uboot zc770-dc4:hello zc770-dc4:jtag_hello zc770-dc4:jtag_memory zc770-dc4:jtag_peripheral zc770-dc4:jtag_uboot zc770-dc4:peripheral zc770-dc4:uboot)

echo "Generating tql files for zynq run tests"
board=
cmd=
specific_board=
systest_board=
msg=false

update_board() {
board=
boardlist=(zc702 zc702_ecc zc702_eusb_board zc702_usb_board zc706 zc706_ecc zc706_stack zc706_usb_board zc770_dc1 zc770_dc2_x8 zc770_dc2_x16 zc770_dc3 zc770_dc4 zed git_zed microzed git_microzed kc705 eMMC_board eMMC_board_zc706 QSPI_ZC702_ENV zc702_armcc zc702_armcc_ zc702_armcc_armcc zc770_dc2_x8_armcc zc770_dc1_armcc git_zc702 git_zc706 zc706_stack zc706_emmc)
	for each in "${boardlist[@]}"; do
		brd="${2}_${each}"[@]
		brd_list=( "${!brd}" )
		for element in "${brd_list[@]}"; do
			if [ $1 == ${element} ]
			then
				board=${each}
				break
			fi
		done

		if [ -n "${board}" ]
		then
			break
		fi
	done

	if [ "${board}" == "zc702_eusb_board" ] ||
		[ "${board}" == "zc702_usb_board" ] ||
		[ "${board}" == "zc706_usb_board" ] ||
		[ "${board}" == "eMMC_board" ] ||
		[ "${board}" == "eMMC_board_zc706" ] ||
		[ "${board}" == "QSPI_ZC702_ENV" ]
	then
		return 0
	fi

	board=`echo ${board} | sed 's/_/-/g'`
}

fetch_cmd() {
	cmd=
if [ -f $1/test.info ];
then
        cmd=`grep -nrF 'COMMAND' $1/test.info | cut -d':' -f3 | sed 's/^[ \t]*//;s/[ \t]*$//'`
	cmd=`echo ${cmd} | sed s///g`
	specific_board=`echo ${cmd} | cut -d ' ' -f 5`

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

check_msg() {
	msg=false
if [ -f $1/msg.xml ];
then
        msg=true
fi
}

common_board_list() {
if [ "$SITE" == "XHD" ]; then
	XHDzc706="xhd-zc706-1,xhd-zc706-10,xhd-zc706-9"
	XHDzc702="xhd-zc702-1,xhd-zc702-3,xhd-zc702-5,xhd-zc702-14,xhd-zc702-7,xhd-zc706-10,xhd-zc702-11,xhd-zc702-12"
	XHDzc770dc1="xhd-zc770-4"
	XHDzc770dc2x8="xhd-zc770-7,xhd-zc770-10"
	XHDzc770dc2x16="xhd-zc770-9"
	XHDzc770dc3="xhd-zc770-8"
	XHDzc770dc4="xhd-zc770-6"
	XHDzed="xhd-zed-1,xhd-zed-2"
	XHDzc706stack="xhd-zc706-12"
	if [ "$board" == "zc702" ] || [ "$board" == "zc702-ecc" ]
	then
		systest_board=${XHDzc702}
	fi
        if [ "$board" == "zc706" ] || [ "$board" == "zc706-ecc" ]
        then
                systest_board=${XHDzc706}
        fi
        if [ "$board" == "zc770-dc1" ]
        then
                systest_board=${XHDzc770dc1}
        fi
        if [ "$board" == "zc770-dc2-x8" ]
        then
                systest_board=${XHDzc770dc2x8}

        fi
        if [ "$board" == "zc770-dc2-x16" ]
        then
                systest_board=${XHDzc770dc2x16}
	fi

        if [ "$board" == "zc770-dc3" ]
        then
                systest_board=${XHDzc770dc3}
        fi
        if [ "$board" == "zc770-dc4" ]
        then
                systest_board=${XHDzc770dc4}
        fi
        if [ "$board" == "zed" ]
        then
                systest_board=${XHDzed}
        fi
	if [ "$board" == "zc706-stack" ]
        then
                systest_board=${XHDzc706stack}
        fi

else
	XSJzc706="zc706-3,zc706-4,zc706-5,zc706-6,zc706-8,zc706-10,zc706-11,zc706-12,zc706-13,zc706-14,zc706-16,zc706-17,zc706-18"
        XSJzc702="zc702-2,zc702-3,zc702-5,zc702-6,zc702-7,zc702-8,zc702-9,zc702-10,zc702-11,zc702-12,zc702-13,zc702-14"
        XSJzc770dc1="zc770-15,zc770-3,zc770-4,zc770-10,zc770-7"
        XSJzc770dc2x8="zc770-1,zc770-19"
        XSJzc770dc2x16="zc770-2,zc770-6"
        XSJzc770dc3="zc770-25,zc770-29"
        XSJzc770dc4="zc770-21,zc770-31"
        XSJzed="zed-3"
	if [ "$board" == "zc702" ] || [ "$board" == "zc702-ecc" ]
        then
                systest_board=${XSJzc702}
        fi
        if [ "$board" == "zc706" ] || [ "$board" == "zc706-ecc" ]
        then
                systest_board=${XSJzc706}
        fi
        if [ "$board" == "zc770-dc1" ]
        then
                systest_board=${XSJzc770dc1}
        fi
        if [ "$board" == "zc770-dc2-x8" ]
        then
                systest_board=${XSJzc770dc2x8}
        fi
	if [ "$board" == "zc770-dc2-x16" ]
	then
		systest_board=${XSJzc770dc2x16}
	fi
        if [ "$board" == "zc770-dc3" ]
        then
                systest_board=${XSJzc770dc3}
        fi
        if [ "$board" == "zc770-dc4" ]
        then
                systest_board=${XSJzc770dc4}
        fi
       if [ "$board" == "zed" ]
        then
                systest_board=${XSJzed}
        fi
fi
}

rsa_board_list() {
	XHDrsazc702="xhd-zc702-2"
	if [ "$SITE" == "XHD" ]; then
		if [ "$board" == "zc702" ]
		then
			systest_board=${XHDrsazc702}
		fi
	else
		XSJrsazc770dc2x8="zc770-23"
		if [ "$board" == "zc770-dc2-x8" ]
        	then
                	systest_board=${XSJrsazc770dc2x8}
        	fi
	fi
}

run_linux_tql() {
	tqlfile=$1

	linux_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/linux 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
	for module in "${linux_modules[@]}"; do
		update_board ${module} linux
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/linux/${module}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_LINUX'," >> $tqlfile
		echo -e "\t\ttsuite = 'DEFAULT'," >> $tqlfile
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/linux/${module}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${module}'," >> $tqlfile
		echo -e "\t\tmodule = '${module}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/linux/${module}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		if [ -z $specific_board ]; then	
			common_board_list $board
			echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		else
			echo -e "\t\tboard = '${specific_board}'," >> $tqlfile
		fi
		echo -e "\t\treg_type = 'sanity'," >> $tqlfile
		echo -e "\t\treg_subtype = ''," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/linux/${module}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/linux/${module}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/linux/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_linux_${module};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

run_perf_linux_tql() {
	tqlfile=$1

	perflinux_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/perf_linux 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
	for module in "${perflinux_modules[@]}"; do
		update_board ${module} perflinux
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/perf_linux/${module}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_PERF_LINUX'," >> $tqlfile
		echo -e "\t\ttsuite = 'DEFAULT'," >> $tqlfile
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/perf_linux/${module}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${module}'," >> $tqlfile
		echo -e "\t\tmodule = '${module}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/perf_linux/${module}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		if [ -z $specific_board ]; then	
			common_board_list $board
			echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		else
			echo -e "\t\tboard = '${specific_board}'," >> $tqlfile
		fi

		echo -e "\t\treg_type = 'sanity'," >> $tqlfile
		echo -e "\t\treg_subtype = ''," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/perf_linux/${module}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/perf_linux/${module}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/perf_linux/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_perf_linux_${module};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

run_uboot_tql() {
	tqlfile=$1

uboot_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/uboot  2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${uboot_modules[@]}"; do
uboot_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/uboot/${module} 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module_1 in "${uboot_tempmodules[@]}"; do
uboot_submodules+=(${module}:${module_1})
done
done

	for module in "${uboot_submodules[@]}"; do
		test_major=`echo ${module} | cut -d: -f1`
		test_minor=`echo ${module} | cut -d: -f2`
		update_board ${test_minor} uboot
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/uboot/${test_major}/${test_minor}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_UBOOT'," >> $tqlfile
		if [ "${test_major}" == "ps7_init_flow" ];
		then
			echo -e "\t\ttsuite = 'PS7_INIT_FLOW'," >> $tqlfile
		else
			echo -e "\t\ttsuite = 'DEFAULT'," >> $tqlfile
		fi
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/uboot/${test_major}/${test_minor}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${test_minor}'," >> $tqlfile
		echo -e "\t\tmodule = '${test_major}'," >> $tqlfile
		echo -e "\t\tsub_module = '${test_minor}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/uboot/${test_major}/${test_minor}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		if [ -z $specific_board ]; then	
			common_board_list $board
			echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		else
			echo -e "\t\tboard = '${specific_board}'," >> $tqlfile
		fi

		echo -e "\t\treg_type = 'sanity'," >> $tqlfile
		echo -e "\t\treg_subtype = ''," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/uboot/${test_major}/${test_minor}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/uboot/${test_major}/${test_minor}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/uboot/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_uboot_${test_major}_${test_minor};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

run_fsbl_tql() {
	tqlfile=$1

fsbl_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/fsbl 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${fsbl_modules[@]}"; do
fsbl_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/fsbl/${module} 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module_1 in "${fsbl_tempmodules[@]}"; do
fsbl_submodules+=(${module}:${module_1})
done
done

	for module in "${fsbl_submodules[@]}"; do
		test_major=`echo ${module} | cut -d: -f1`
		test_minor=`echo ${module} | cut -d: -f2`
		update_board ${module} fsbl
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/fsbl/${test_major}/${test_minor}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_FSBL'," >> $tqlfile
		echo -e "\t\ttsuite = '`echo ${test_major} | awk '{print toupper($0)}'`'," >> $tqlfile
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/fsbl/${test_major}/${test_minor}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${test_minor}'," >> $tqlfile
		echo -e "\t\tmodule = '${test_major}'," >> $tqlfile
		echo -e "\t\tsub_module = '${test_minor}'," >> $tqlfile
		common_board_list $board
		echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/fsbl/${test_major}/${test_minor}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		echo -e "\t\treg_type = 'sanity'," >> $tqlfile
		echo -e "\t\treg_subtype = ''," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/fsbl/${test_major}/${test_minor}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/fsbl/${test_major}/${test_minor}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/fsbl/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_fsbl_${test_major}_${test_minor};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

run_rsa_tql() {
	tqlfile=$1

rsa_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/rsa 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${rsa_modules[@]}"; do
rsa_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${module} 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
if [ -z "${rsa_tempmodules}" ]
then
rsa_submodules+=(${module})
else
for module_1 in "${rsa_tempmodules[@]}"; do
rsa_submodules+=(${module}:${module_1})
done
fi
done

	for module in "${rsa_submodules[@]}"; do
		test_major=`echo ${module} | cut -d: -f1`
		test_minor=`echo ${module} | cut -d: -f2`
		update_board ${test_minor} rsa
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/rsa/${test_major}/${test_minor}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_RSA'," >> $tqlfile
		echo -e "\t\ttsuite = '`echo ${test_major} | awk '{print toupper($0)}'`'," >> $tqlfile
		echo -e "\t\tmodule = '${test_major}'," >> $tqlfile
 		if [ ${test_major} = ${test_minor} ];
		then
			fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}
			fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}
			check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}
			echo -e "\t\tsub_module = ''," >> $tqlfile
		else
			fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}/${test_minor}
			fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}/${test_minor}
			check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}/${test_minor}
			echo -e "\t\tsub_module = '${test_minor}'," >> $tqlfile
		fi
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${test_minor}'," >> $tqlfile
		rsa_board_list $board
		echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		echo -e "\t\treg_type = 'sanity'," >> $tqlfile
		echo -e "\t\treg_subtype = ''," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		if [ "${msg}" == "true" ];
		then
			if [ ${test_major} = ${test_minor} ];
			then
				echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}/msg.xml'" >> $tqlfile
			else
				echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}/${test_minor}/msg.xml'" >> $tqlfile
			fi
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/rsa/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_rsa_${test_major}_${test_minor};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

run_uboot_rsa_tql() {
	tqlfile=$1

rsa_uboot_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/uboot_rsa 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${rsa_uboot_modules[@]}"; do
rsa_uboot_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/uboot_rsa/${module} 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module_1 in "${rsa_uboot_tempmodules[@]}"; do
rsa_uboot_submodules+=(${module}:${module_1})
done
done

for module in "${rsa_uboot_submodules[@]}"; do
		test_major=`echo ${module} | cut -d: -f1`
		test_minor=`echo ${module} | cut -d: -f2`
		update_board ${test_minor} ubootrsa
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/uboot_rsa/${test_major}/${test_minor}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_UBOOT_RSA'," >> $tqlfile
		echo -e "\t\ttsuite = '`echo ${test_major} | awk '{print toupper($0)}'`'," >> $tqlfile
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/uboot_rsa/${test_major}/${test_minor}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${test_minor}'," >> $tqlfile
		echo -e "\t\tmodule = '${test_major}'," >> $tqlfile
		echo -e "\t\tsub_module = '${test_minor}'," >> $tqlfile
		rsa_board_list $board
		echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/uboot_rsa/${test_major}/${test_minor}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		echo -e "\t\treg_type = 'sanity'," >> $tqlfile
		echo -e "\t\treg_subtype = ''," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/uboot_rsa/${test_major}/${test_minor}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/uboot_rsa/${test_major}/${test_minor}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/uboot_rsa/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_uboot_rsa_${test_major}_${test_minor};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
done
}

run_system_tql() {
	tqlfile=$1

system_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/system 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${system_modules[@]}"; do
system_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/system/${module} 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module_1 in "${system_tempmodules[@]}"; do
system_submodules+=(${module}:${module_1})
done
done

	for module in "${system_submodules[@]}"; do
		test_major=`echo ${module} | cut -d: -f1`
		test_minor=`echo ${module} | cut -d: -f2`
		update_board ${test_minor} system
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/system/${test_major}/${test_minor}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_SYSTEM'," >> $tqlfile
		echo -e "\t\ttsuite = 'DEFAULT'," >> $tqlfile
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/system/${test_major}/${test_minor}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${test_minor}'," >> $tqlfile
		echo -e "\t\tmodule = '${test_major}'," >> $tqlfile
		echo -e "\t\tsub_module = '${test_minor}'," >> $tqlfile
		common_board_list $board
		echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/system/${test_major}/${test_minor}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		echo -e "\t\treg_type = 'sanity'," >> $tqlfile
		echo -e "\t\treg_subtype = ''," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/system/${test_major}/${test_minor}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/system/${test_major}/${test_minor}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/system/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_system_${test_major}_${test_minor};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

run_flash_utility_tql() {
	tqlfile=$1
flash_utility_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/flash_utility 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${flash_utility_modules[@]}"; do
flash_utility_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/flash_utility/${module} 2>/dev/null | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module_1 in "${flash_utility_tempmodules[@]}"; do
flash_utility_submodules+=(${module}:${module_1})
done
done

	for module in "${flash_utility_submodules[@]}"; do
		test_major=`echo ${module} | cut -d: -f1`
		test_minor=`echo ${module} | cut -d: -f2`
		update_board ${test_minor} flashutility
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/flash_utility/${test_major}/${test_minor}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_FLASH_UTILITY'," >> $tqlfile
		echo -e "\t\ttsuite = 'DEFAULT'," >> $tqlfile
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/flash_utility/${test_major}/${test_minor}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${test_minor}'," >> $tqlfile
		echo -e "\t\tmodule = '${test_major}'," >> $tqlfile
		echo -e "\t\tsub_module = '${test_minor}'," >> $tqlfile
		common_board_list $board
		echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/flash_utility/${test_major}/${test_minor}
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		echo -e "\t\treg_type = 'sanity'," >> $tqlfile
		echo -e "\t\treg_subtype = ''," >> $tqlfile
		echo -e "\t\tpriority = '1'," >> $tqlfile
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/flash_utility/${test_major}/${test_minor}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/flash_utility/${test_major}/${test_minor}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/flash_utility/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_flash_utility_${test_major}_${test_minor};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

tqls=(linux perf_linux rsa uboot_rsa uboot system flash_utility fsbl)
for mod in "${tqls[@]}"; do
	tqlfile=${mod}.tql
	run_${mod}_tql "$tqlfile"
done

echo "done....thanks"
exit 0
