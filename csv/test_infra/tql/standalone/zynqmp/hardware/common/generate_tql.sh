
fsbl_tql() {
        component=$1
        reg_type=$2
        version=$3
        bootmode=$4
        tqlfile=$5
	module=$6
	board=$7

        bifdir=$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fsbl/bif/${version}_bit

        echo "###### ${bootmode} boot mode #####" >> $tqlfile
        echo -e " " >> $tqlfile


        for biffile in $bifdir/*.bif ; do
        # Extract the test name before ".bif" and assign
                test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`
                biffile_name="${test}.bif"
                if echo "${biffile_name}" | grep -q "_all.bif"; then
                        export test_device="eg"
                elif echo "${biffile_name}" | grep -q "_cg.bif"; then
                        export test_device="cg"
                else
                        export test_device="$ZCU102_PS"
                fi

                echo "FROM \$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fsbl/${bootmode}/${module}/${version}_bit" >> $tqlfile
                echo "TEMPLATE" >> $tqlfile
                echo -e "\t user { " >> $tqlfile
                echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
                echo -e "\t\t ssuite = 'fsbl'," >> $tqlfile
                echo -e "\t\t version = '${version}_bit'," >> $tqlfile
                echo -e "\t\t module = '${module}'," >> $tqlfile
                echo -e "\t\t board = '${board}'," >> $tqlfile
                echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
                echo -e "\t\t test_name = '${test}'," >> $tqlfile
                echo -e "\t\t test_device = '${test_device}'," >> $tqlfile
                echo -e "\t\t priority = '1'," >> $tqlfile
                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
                echo -e "\t\t reg_subtype = '${version}'," >> $tqlfile
                echo -e "\t\t name = 'fsbl_${bootmode}_${version}_${test}'," >> $tqlfile
                echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
                echo -e "\t } " >> $tqlfile
                echo "AS fsbl_${bootmode}_${version}_${test};" >> $tqlfile
                echo -e " " >> $tqlfile
        done
}

fsbl_dl_tql() {
        component=$1
        reg_type=$2
        version=$3
        bootmode=$4
        tqlfile=$5
        module=$6
        board=$7

        bifdir=$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fsbl_ddr_less/bif/${version}_bit

        echo "###### ${bootmode} boot mode #####" >> $tqlfile
        echo -e " " >> $tqlfile

        for biffile in $bifdir/*.bif ; do
        # Extract the test name before ".bif" and assign
                test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`

                echo "FROM \$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fsbl_ddr_less/${bootmode}/${module}/${version}_bit" >> $tqlfile
                echo "TEMPLATE" >> $tqlfile
                echo -e "\t user { " >> $tqlfile
                echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
                echo -e "\t\t ssuite = 'fsbl_ddr_less'," >> $tqlfile
                echo -e "\t\t version = '${version}_bit'," >> $tqlfile
                echo -e "\t\t module = '${module}'," >> $tqlfile
                echo -e "\t\t board = '${board}'," >> $tqlfile
                echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
                echo -e "\t\t test_name = '${test}'," >> $tqlfile
                echo -e "\t\t priority = '1'," >> $tqlfile
                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
                echo -e "\t\t reg_subtype = '${version}'," >> $tqlfile
                echo -e "\t\t name = 'fsbl_ddr_less_${bootmode}_${version}_${test}'," >> $tqlfile
                echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
                echo -e "\t } " >> $tqlfile
                echo "AS fsbl_ddr_less_${bootmode}_${version}_${test};" >> $tqlfile
                echo -e " " >> $tqlfile
        done
}

fsbl_secure_tql() {
        component=$1
        reg_type=$2
        version=$3
        bootmode=$4
        tqlfile=$5
        module=$6
        board=$7

        bifdir=$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fsbl_secure/bif_secure/${version}_bit

        echo "###### ${bootmode} boot mode #####" >> $tqlfile
        echo -e " " >> $tqlfile

        for biffile in $bifdir/*.bif ; do
        # Extract the test name before ".bif" and assign
                test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`

                biffile_name="${test}.bif"
                if echo "${biffile_name}" | grep -q "_all.bif"; then
                        export test_device="eg"
                elif echo "${biffile_name}" | grep -q "_cg.bif"; then
                        export test_device="cg"
                else
                        export test_device="$ZCU102_PS"
                fi

                echo "FROM \$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fsbl_secure/${bootmode}/${module}/${version}_bit" >> $tqlfile
                echo "TEMPLATE" >> $tqlfile
                echo -e "\t user { " >> $tqlfile
                echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
                echo -e "\t\t ssuite = 'fsbl_secure'," >> $tqlfile
                echo -e "\t\t version = '${version}_bit'," >> $tqlfile
                echo -e "\t\t module = '${module}'," >> $tqlfile
                echo -e "\t\t board = '${board}'," >> $tqlfile
                echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
                echo -e "\t\t test_name = '${test}'," >> $tqlfile
                echo -e "\t\t test_device = '${test_device}'," >> $tqlfile
                echo -e "\t\t priority = '1'," >> $tqlfile
                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
                echo -e "\t\t reg_subtype = '${version}'," >> $tqlfile
                echo -e "\t\t name = 'fsbl_secure_${bootmode}_${version}_${test}'," >> $tqlfile
                echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
                echo -e "\t } " >> $tqlfile
                echo "AS fsbl_secure_${bootmode}_${version}_${test};" >> $tqlfile
                echo -e " " >> $tqlfile
        done
}

fsbl_dl_secure_tql() {
        component=$1
        reg_type=$2
        version=$3
        bootmode=$4
        tqlfile=$5
        module=$6
        board=$7 

	bifdir=$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fsbl_ddr_less_secure/bif_secure/${version}_bit

        echo "###### ${bootmode} boot mode #####" >> $tqlfile
        echo -e " " >> $tqlfile

        for biffile in $bifdir/*.bif ; do
        # Extract the test name before ".bif" and assign
                test=`echo $biffile | rev | cut -d "/" -f 1 | rev | head -n 1 | cut -d "." -f 1`

                echo "FROM \$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fsbl_ddr_less_secure/${bootmode}/${module}/${version}_bit" >> $tqlfile
                echo "TEMPLATE" >> $tqlfile
                echo -e "\t user { " >> $tqlfile
                echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
                echo -e "\t\t ssuite = 'fsbl_dl_secure'," >> $tqlfile
                echo -e "\t\t version = '${version}_bit'," >> $tqlfile
                echo -e "\t\t module = '${module}'," >> $tqlfile
                echo -e "\t\t board = '${board}'," >> $tqlfile
                echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
                echo -e "\t\t test_name = '${test}'," >> $tqlfile
                echo -e "\t\t priority = '1'," >> $tqlfile
                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
                echo -e "\t\t reg_subtype = '${version}'," >> $tqlfile
                echo -e "\t\t name = 'fsbl_dl_secure_${bootmode}_${version}_${test}'," >> $tqlfile
                echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
                echo -e "\t } " >> $tqlfile
                echo "AS fsbl_dl_secure_${bootmode}_${version}_${test};" >> $tqlfile
                echo -e " " >> $tqlfile
        done
}

fallback_tql() {
        component=$1
        reg_type=$2
        version=$3
        bootmode=$4
        tqlfile=$5
        test=$6
        bin_file=$7
        module=$8
        board=$9

        COMMON_DIR=/group/siv2_xhd/work/lovek/rdi/tcRepo/vnc/scripts/execute/fallback

        echo "FROM \$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/fallback/${bootmode}/${module}/${version}_bit" >> $tqlfile
        echo "TEMPLATE" >> $tqlfile
        echo -e "\t user { " >> $tqlfile
        echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
        echo -e "\t\t ssuite = 'fallback'," >> $tqlfile
        echo -e "\t\t version = '${version}_bit'," >> $tqlfile
        echo -e "\t\t module = '${module}'," >> $tqlfile
        echo -e "\t\t board = '${board}'," >> $tqlfile
        echo -e "\t\t bin_file = '$bin_file'," >> $tqlfile
        echo -e "\t\t test_name = '${test}'," >> $tqlfile
        echo -e "\t\t priority = '1'," >> $tqlfile
        echo -e "\t\t component = '${component}'," >> $tqlfile
        echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
        echo -e "\t\t name = 'fallback_${bootmode}_${version}_${test}'," >> $tqlfile
        echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
        echo -e "\t } " >> $tqlfile
        echo "AS fallback_${bootmode}_${version}_${test};" >> $tqlfile
        echo -e " " >> $tqlfile
}

fallback_module_tql() {
        component=$1
        reg_type=$2
        version=$3
        bootmode=$4
        tqlfile=$5
        module=$6
        board=$7

        echo "###### ${bootmode} boot mode #####" >> $tqlfile
        echo -e " " >> $tqlfile

        fallback_tql "$component" "$reg_type" "$version" "$bootmode" "$tqlfile" "boota53_a53_0" "boota53_a53_0.bin" "$module" "$board"
        fallback_tql "$component" "$reg_type" "$version" "$bootmode" "$tqlfile" "bootr5_a53_0" "bootr5_a53_0.bin" "$module" "$board"
        
	if [[ "$input" == "dc"* ]]; then
		fallback_tql "$component" "$reg_type" "$version" "$bootmode" "$tqlfile" "sec_boota53_a53_0" "sec_boota53_a53_0.bin" "$module" "$board"
	        fallback_tql "$component" "$reg_type" "$version" "$bootmode" "$tqlfile" "sec_bootr5_a53_0" "sec_bootr5_a53_0.bin" "$module" "$board"
	fi
        fallback_tql "$component" "$reg_type" "$version" "$bootmode" "$tqlfile" "bootr5_r5l" "bootr5_r5l.bin" "$module" "$board"
}

freertos_tql() {
        bifdir=$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/freertos/bif
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
                        export test_device="$ZCU102_PS"
                fi

#                if [[ "$test" == "boota53_freertos" || "$test" == "boota53_freertosl" || "$test" == "bootr5_freertos" || "$test" == "bootr5_freertosl" ]]; then
#			continue;
#                fi

                echo "FROM \$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/freertos/${bootmode}/${module}/${version}_bit" >> $tqlfile
                echo "TEMPLATE" >> $tqlfile
                echo -e "\t user { " >> $tqlfile
                echo -e "\t\t tsuite = '$bootmode'," >> $tqlfile
                echo -e "\t\t ssuite = 'freertos'," >> $tqlfile
                echo -e "\t\t version = '${version}_bit'," >> $tqlfile
                echo -e "\t\t module = '${module}'," >> $tqlfile
                echo -e "\t\t board = '${board}'," >> $tqlfile
                echo -e "\t\t bin_file = '${test}.bin'," >> $tqlfile
                echo -e "\t\t test_name = '${test}'," >> $tqlfile
                echo -e "\t\t test_device = '${test_device}'," >> $tqlfile
                echo -e "\t\t priority = '1'," >> $tqlfile
                echo -e "\t\t component = '${component}'," >> $tqlfile
                echo -e "\t\t reg_type = '${reg_type}'," >> $tqlfile
                echo -e "\t\t name = 'freertos_${bootmode}_${version}_${test}'," >> $tqlfile
                echo -e "\t\t messagefile = '${COMMON_DIR}/msg.xml'" >> $tqlfile
                echo -e "\t } " >> $tqlfile
                echo "AS freertos_${bootmode}_${version}_${test};" >> $tqlfile
                echo -e " " >> $tqlfile
        done
}

module_tql() {
        component=$1
        reg_type=$2
        tqlfile=$3
        test=$4
        tsuite=$5
        ssuite=$6

        echo "FROM \$RDI_DEMO_DIR/tcRepo/standalone/tests/systest/zynqmp-others/execute/$ssuite/${module}" >> $tqlfile
        echo "TEMPLATE" >> $tqlfile
        echo -e "\t user { " >> $tqlfile
        echo -e "\t\t tsuite = '$tsuite'," >> $tqlfile
        echo -e "\t\t ssuite = '$ssuite'," >> $tqlfile
        echo -e "\t\t module = '${module}'," >> $tqlfile
        echo -e "\t\t board = '${board}'," >> $tqlfile
        echo -e "\t\t test_name = '${test}'," >> $tqlfile
        echo -e "\t\t priority = '1'," >> $tqlfile
        echo -e "\t\t component = '${component}'," >> $tqlfile
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

