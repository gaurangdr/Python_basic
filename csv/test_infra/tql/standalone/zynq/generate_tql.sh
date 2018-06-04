#!/bin/bash

ls | grep -v generate_tql.sh | xargs rm -rf
### Below is the list of array mapping boards with test cases
##### Perf standalone modules
perfstandalone_kc705+=(kc705_lwip_rx kc705_lwip_tx)
perfstandalone_zc702+=(sdps_intgtest lwip_rx lwip_tx qspips_single_intgtest usb_perf)
perfstandalone_zc706+=(qspips_dual_intgtest)
perfstandalone_zc770_dc1+=(spips_intgtest)
perfstandalone_zc770_dc2_x8+=(nandps_intgtest)

##### RSA Modules
rsa_zc702+=(efsbl_a_uboot_a_linux fsbl_a_uboot_a_linux fsbl_a_uboot_linux fsbl_ae_size_hello fsbl_ae_uboot_ae_linux fsbl_uboot_linux fsbl_ae_bit_a_hello fsbl_ae_bit_ae_hello fsbl_ae_hello fsbl_fallback fsbl_md5_ae_uboot_ae_linux qspi_secure_fallback fsbl_owner_uboot_linux fsbl_owner_uboot_linux_aes sd_fsbl_a_uboot_a_linux sd_fsbl_ae_uboot_ae_linux fsbl_owner_uboot_linux fsbl_owner_uboot_linux_aes sd_fsbl_owner_uboot_linux sd_fsbl_owner_uboot_linux_aes)

##### Drivers Module
drivers_zc702_armcc+=(armcc:xadcps_intr_example armcc:xadcps_polled_printf_example armcc:xcanps_intr_example armcc:xcanps_polled_example armcc:xcanps_watermark_intr_example armcc:xdevcfg_polled_example armcc:xdevcfg_selftest_example armcc:xdmaps_example_w_intr armcc:xilffs_polled_example armcc:xilffs_polled_example_emmc armcc:xilisf_qspips_stm_intr_example armcc:xilisf_qspips_stm_polled_example armcc:xqspips_flash_intr_example armcc:xqspips_flash_polled_example armcc:xscutimer_intr_example armcc:xttcps_rtc_example armcc:xuartps_intr_example armcc:xuartps_polled_example zc702-armcc:xadcps_intr_example zc702-armcc:xadcps_polled_printf_example zc702-armcc:xcanps_intr_example zc702-armcc:xcanps_polled_example zc702-armcc:xcanps_watermark_intr_example zc702-armcc:xdevcfg_interrupt_example zc702-armcc:xdevcfg_polled_example zc702-armcc:xdevcfg_selftest_example zc702-armcc:xdmaps_example_w_intr zc702-armcc:xemacps_example_intr_dma zc702-armcc:xgpiops_polled_example zc702-armcc:xiicps_eeprom_intr_example zc702-armcc:xiicps_eeprom_polled_example zc702-armcc:xscugic_example zc702-armcc:xscutimer_intr_example zc702-armcc:xttcps_intr_example zc702-armcc:xttcps_low_level_example zc702-armcc:xttcps_rtc_example zc702-armcc:xuartps_intr_example zc702-armcc:xuartps_polled_example)
#drivers_zc702_armcc_+=(armcc:xdevcfg_interrupt_example)
#drivers_zc702_armcc_armcc+=(armcc:xgpiops_intr_example armcc:xgpiops_polled_example armcc:xiicps_eeprom_intr_example armcc:xiicps_eeprom_polled_example armcc:xqspips_selftest_example armcc:xscugic_example armcc:xscuwdt_polled_example)
drivers_zc702+=(armcc:xemacps_example_intr_dma armcc:xemacps_ieee1588_example armcc:xscuwdt_intr_example armcc:xttcps_intr_example armcc:xttcps_low_level_example git-zc702:wdtps_intgtest git-zc702:xadc_selftest git-zc702:xemacps_example_intr_dma git-zc702:xemacps_ieee1588_example git-zc702:xttcps_intr_example git-zc702:xwdtps_intr_example git-zc702:xwdtps_polled_example zc702:canps_intgtest zc702:dmaps_intgtest zc702:emacps_intgtest zc702:gpiops_intgtest zc702:iicps_intgtest zc702:lwip_echo_server zc702:scugic_intgtest zc702:scutimer_intgtest zc702:scuwdt_intgtest zc702:ttcps_intgtest zc702:usbps_enum zc702:usbps_rw zc702:wdtps_intgtest zc702:xadc_selftest zc702:xadcps_intr_example zc702:xadcps_polled_printf_example zc702:xcanps_intr_example zc702:xcanps_polled_example zc702:xcanps_watermark_intr_example zc702:xdevcfg_interrupt_example zc702:xdevcfg_polled_example zc702:xdevcfg_selftest_example zc702:xdmaps_example_w_intr zc702:xemacps_example_intr_dma zc702:xemacps_ieee1588_example zc702:xgpiops_polled_example zc702:xiicps_eeprom_intr_example zc702:xiicps_eeprom_polled_example zc702:xilffs_polled_example zc702:xilffs_polled_example_emmc zc702:xilisf_qspips_stm_intr_example zc702:xilisf_qspips_stm_polled_example zc702:xqspips_flash_intr_example zc702:xqspips_flash_polled_example zc702:xqspips_selftest_example zc702:xscugic_example zc702:xscutimer_intr_example zc702:xscuwdt_intr_example zc702:xscuwdt_polled_example zc702:xttcps_intr_example zc702:xttcps_low_level_example zc702:xttcps_rtc_example zc702:xuartps_intr_example zc702:xuartps_polled_example)
drivers_zc770_dc2_x8_armcc+=(armcc:xnandps_cache_example armcc:xnandps_example zc770-dc2-x8-armcc:xnandps_cache_example zc770-dc2-x8-armcc:xnandps_example zc770-dc2-x8-armcc:xnandps_skip_example)
drivers_zc770_dc2_x8+=(armcc:xnandps_skip_example git-zc770-dc2-x8:nandps_intgtest git-zc770-dc2-x8:scuwdt_intgtest git-zc770-dc2-x8:ttcps_intgtest git-zc770-dc2-x8:wdtps_intgtest git-zc770-dc2-x8:xnandps_cache_example git-zc770-dc2-x8:xnandps_example git-zc770-dc2-x8:xnandps_skip_example git-zc770-dc2-x8:xscuwdt_intr_example git-zc770-dc2-x8:xuartps_intr_example git-zc770-dc2-x8:xwdtps_intr_example git-zc770-dc2-x8:xwdtps_polled_example zc770-dc2-x8:nandps_intgtest zc770-dc2-x8:nandps_intgtest zc770-dc2-x8:scuwdt_intgtest zc770-dc2-x8:ttcps_intgtest zc770-dc2-x8:wdtps_intgtest zc770-dc2-x8:xnandps_cache_example zc770-dc2-x8:xnandps_example zc770-dc2-x8:xnandps_skip_example zc770-dc2-x8:xscuwdt_intr_example zc770-dc2-x8:xscuwdt_intr_example zc770-dc2-x8:xscuwdt_polled_example zc770-dc2-x8:xuartps_intr_example zc770-dc2-x8:xwdtps_intr_example zc770-dc2-x8:xwdtps_polled_example)
drivers_zc770_dc1+=(armcc:xspips_flash_intr_example armcc:xspips_selftest_example zc770-dc1-armcc:spips_intgtest zc770-dc1:spips_intgtest zc770-dc1:uartps_intgtest zc770-dc1:xilisf_spips_sst_intr_example zc770-dc1:xilisf_spips_sst_polled_example zc770-dc1:xspips_flash_intr_example zc770-dc1:xspips_flash_polled_example zc770-dc1:xspips_selftest_example zc770-dc4:xspips_eeprom_intr_example zc770-dc4:xspips_eeprom_polled_example)
drivers_zc770_dc1_armcc+=(armcc:xspips_flash_polled_example zc770-dc1-armcc:xilisf_spips_sst_intr_example zc770-dc1-armcc:xilisf_spips_sst_polled_example zc770-dc1-armcc:xspips_flash_intr_example zc770-dc1-armcc:xspips_flash_polled_example zc770-dc1-armcc:xspips_selftest_example)
drivers_zc706+=(git-zc706:ttcps_intgtest git-zc706:wdtps_intgtest git-zc706:xemacps_example_intr_dma git-zc706:xuartps_polled_example git-zc706:xwdtps_intr_example git-zc706:xwdtps_polled_example zc706:dmaps_intgtest zc706:emacps_intgtest zc706:iicps_intgtest zc706:lwip_echo_server zc706:qspips_intgtest zc706:scugic_intgtest zc706:scutimer_intgtest zc706:scuwdt_intgtest zc706:sdps_intgtest zc706:ttcps_intgtest zc706:ttcps_intgtest zc706:wdtps_intgtest zc706:xadcps_intr_example zc706:xadcps_polled_printf_example zc706:xdmaps_example_w_intr zc706:xemacps_example_intr_dma zc706:xiicps_eeprom_intr_example zc706:xiicps_eeprom_polled_example zc706:xilffs_polled_example zc706:xilffs_polled_example_emmc zc706:xqspi_flash_intr_example zc706:xqspips_flash_polled_example zc706:xqspips_selftest_example zc706:xscugic_example zc706:xscutimer_intr_example zc706:xttcps_intr_example zc706:xttcps_low_level_example zc706:xttcps_rtc_example zc706:xuartps_intr_example zc706:xuartps_polled_example zc706:xwdtps_intr_example zc706:xwdtps_polled_example)
drivers_eMMC_board+=(zc702:emmc_intgtest)
drivers_zc706_stack+=(zc706-stack:qspips_intgtest)
drivers_zc706_emmc+=(zc706:emmc_intgtest)
drivers_zc770_dc2_x16+=(zc770-dc2-x16:nandps_intgtest zc770-dc2-x16:xnandps_cache_example zc770-dc2-x16:xnandps_example zc770-dc2-x16:xnandps_skip_example zc770-dc2-x16:xscuwdt_intr_example zc770-dc2-x16:xscuwdt_polled_example)
drivers_zc770_dc3+=(zc770-dc3:xilflash_readwrite_example)

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
	specific_board=`echo ${cmd} | cut -d ' ' -f 4`
fi
}

fetch_cmd_rsa_fsbl() {
	cmd=
if [ -f $1/test.info ];
then
        cmd=`grep -nrF 'COMMAND' $1/test.info | cut -d':' -f3 | sed 's/^[ \t]*//;s/[ \t]*$//'`
	cmd=`echo ${cmd} | sed s///g`
	specific_board=`echo ${cmd} | cut -d ' ' -f 5`
	if [ "$specific_board" == "bbram" ] || [ "$specific_board" == "efuse" ]; then
		specific_board=""
	fi
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
#XHDzc706="xhd-zc706-3"
XHDzc702="xhd-zc702-1,xhd-zc702-2,xhd-zc702-5,xhd-zc702-4,xhd-zc702-10"
XHDzc770dc1="xhd-zc770-4"
XHDzc770dc2x8="xhd-zc770-7,xhd-zc770-10"
XHDzc770dc2x16="xhd-zc770-9"
XHDzc770dc3="xhd-zc770-8"
XHDzc770dc4="xhd-zc770-6"
XHDeMMC="xhd-zc702-11"
XHDzc706stack="xhd-zc706-12"
XHDeMMCzc706="xhd-zc706-11"

        if [ "$board" == "zc702" ] || [ "$board" == "zc702-armcc" ] || [ "$board" == "zc702-ecc" ]
        then
                systest_board=${XHDzc702}
        fi
        if [ "$board" == "zc706" ] || [ "$board" == "zc706-armcc" ] || [ "$board" == "zc706-ecc" ]
        then
                systest_board=${XHDzc706}
        fi
        if [ "$board" == "zc770-dc1" ] || [ "$board" == "zc770-dc1-armcc" ]
        then
                systest_board=${XHDzc770dc1}
        fi
        if [ "$board" == "zc770-dc2-x8" ] || [ "$board" == "zc770-dc2-x8-armcc" ]
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
       if [ "$board" == "eMMC_board" ]
        then
                systest_board=${XHDeMMC}
        fi
       	if [ "$board" == "zc706-stack" ]
        then
                systest_board=${XHDzc706stack}
        fi
	if [ "$board" == "zc706-emmc" ]
        then
                systest_board=${XHDeMMCzc706}
        fi

else
	XSJzc706="zc706"
        XSJzc702="zc702"
        XSJzc770dc1="zc770-15,zc770-3,zc770-4,zc770-10,zc770-7"
        XSJzc770dc2x8="zc770-1,zc770-19"
        XSJzc770dc2x16="zc770-2,zc770-6"
        XSJzc770dc3="zc770-25,zc770-29"
        XSJzc770dc4="zc770-21,zc770-31"

        if [ "$board" == "zc702" ] || [ "$board" == "zc702-armcc" ]
        then
                systest_board=${XSJzc702}
        fi
        if [ "$board" == "zc706" ] || [ "$board" == "zc706-armcc" ]
        then
                systest_board=${XSJzc706}
        fi
        if [ "$board" == "zc770-dc1" ] || [ "$board" == "zc770-dc1-armcc" ]
        then
                systest_board=${XSJzc770dc1}
        fi
        if [ "$board" == "zc770-dc2-x8" ] || [ "$board" == "zc770-dc2-x8-armcc" ]
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

run_perf_standalone_tql() {
	tqlfile=$1

	perfstandalone_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/perf_standalone | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
	for module in "${perfstandalone_modules[@]}"; do
		update_board ${module} perfstandalone
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/perf_standalone/${module}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_PERF_STANDALONE'," >> $tqlfile
		echo -e "\t\ttsuite = 'DEFAULT'," >> $tqlfile
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/perf_standalone/${module}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${module}'," >> $tqlfile
		echo -e "\t\tmodule = '${module}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/perf_standalone/${module}
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
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/perf_standalone/${module}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/perf_standalone/${module}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/perf_standalone/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_perf_standalone_${module};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

run_drivers_tql() {
	tqlfile=$1

drivers_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/drivers | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${drivers_modules[@]}"; do
drivers_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/drivers/${module} | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module_1 in "${drivers_tempmodules[@]}"; do
drivers_submodules+=(${module}:${module_1})
done
done

	for module in "${drivers_submodules[@]}"; do
		test_major=`echo ${module} | cut -d: -f1`
		test_minor=`echo ${module} | cut -d: -f2`
		update_board ${module} drivers
		if [ "${board}" != "" ]; then
			if [ ! -d ${board} ]; then
				mkdir ${board}
			fi
			pushd ${board} > /dev/null
		else
			continue
		fi
		echo "FROM \$RDI_DEMO_DIR/target_tests/drivers/${test_major}/${test_minor}" >> $tqlfile
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_DRIVERS'," >> $tqlfile
		echo -e "\t\ttsuite = '`echo ${test_major} | awk '{print toupper($0)}'`'," >> $tqlfile
		fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/drivers/${test_major}/${test_minor}
		echo -e "\t\tname = '${name}'," >> $tqlfile
		echo -e "\t\ttest_name = '${test_minor}'," >> $tqlfile
		echo -e "\t\tmodule = '${test_major}'," >> $tqlfile
		echo -e "\t\tsub_module = '${test_minor}'," >> $tqlfile
		fetch_cmd  ${ZYNQ_TARGET_TESTS}/target_tests/drivers/${test_major}/${test_minor}
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
		check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/drivers/${test_major}/${test_minor}
		if [ "${msg}" == "true" ];
		then
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/drivers/${test_major}/${test_minor}/msg.xml'" >> $tqlfile
		else
			echo -e "\t\tmessagefile = '${ZYNQ_TARGET_TESTS}/target_tests/drivers/msg.xml'" >> $tqlfile
		fi
		echo -e "\t}" >> $tqlfile
		echo "AS run_zynq_projects_drivers_${test_major}_${test_minor};" >> $tqlfile
		echo -e "" >> $tqlfile
		chmod 755 $tqlfile
		if [ "${board}" != "" ]; then
			popd > /dev/null
		fi
	done
}

run_fsbl_tql() {
	tqlfile=$1

fsbl_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/fsbl | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${fsbl_modules[@]}"; do
fsbl_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/fsbl/${module} | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
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
		fetch_cmd_rsa_fsbl ${ZYNQ_TARGET_TESTS}/target_tests/fsbl/${test_major}/${test_minor}
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

rsa_modules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/rsa | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
for module in "${rsa_modules[@]}"; do
rsa_tempmodules=($(ls -1p ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${module} | grep / | sed 's/^\(.*\)/\1/' | sed 's/\/$//'))
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
		if [ "${test_major}" != "${test_minor}" ]; then
			echo "FROM \$RDI_DEMO_DIR/target_tests/rsa/${test_major}/${test_minor}" >> $tqlfile
		else
			echo "FROM \$RDI_DEMO_DIR/target_tests/rsa/${test_major}" >> $tqlfile
		fi
		echo "TEMPLATE" >> $tqlfile
		echo -e "\tuser {" >> $tqlfile
		echo -e "\t\tssuite = 'ZYNQ_RSA'," >> $tqlfile
		echo -e "\t\ttsuite = '`echo ${test_major} | awk '{print toupper($0)}'`'," >> $tqlfile
		echo -e "\t\tmodule = '${test_major}'," >> $tqlfile
 		if [ ${test_major} = ${test_minor} ];
		then
			fetch_cmd_rsa_fsbl  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}
			fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}
			check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}
			echo -e "\t\tsub_module = ''," >> $tqlfile
			echo -e "\t\ttest_name = '${module}'," >> $tqlfile
		else
			fetch_cmd_rsa_fsbl  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}/${test_minor}
			fetch_name  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}/${test_minor}
			check_msg  ${ZYNQ_TARGET_TESTS}/target_tests/rsa/${test_major}/${test_minor}
			echo -e "\t\tsub_module = '${test_minor}'," >> $tqlfile
			echo -e "\t\ttest_name = '${test_minor}'," >> $tqlfile
		fi
		echo -e "\t\tname = '${name}'," >> $tqlfile
		if [ -n "$cmd" ]; then
		echo -e "\t\tcommand = '${cmd}'," >> $tqlfile
		fi
		if [ -z $specific_board ]; then	
			rsa_board_list $board
			echo -e "\t\tboard = '${systest_board}'," >> $tqlfile
		else
			echo -e "\t\tboard = '${specific_board}'," >> $tqlfile
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

tqls=(perf_standalone drivers rsa fsbl)
for mod in "${tqls[@]}"; do
	tqlfile=${mod}.tql
	run_${mod}_tql "$tqlfile"
done

echo "done....thanks"
exit 0
