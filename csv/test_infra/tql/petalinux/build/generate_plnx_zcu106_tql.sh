#!/bin/bash

source common/env_var_global.sh petalinux
source common/petalinux/generate_tql_function.sh

tqlfile=$TQL_FILES_PATH/build/build_zcu106.tql
count=`ls -1 $tqlfile 2>/dev/null | wc -l`
if [ $count != 0 ] ; then
        rm -rf $tqlfile
fi

echo $PWD

##### Generating tql file for plnx build #####
plnx_build_tql $tqlfile "zcu106_systest_qspi_boot" "qspi_boot" "systest" "kernel" 
plnx_build_tql $tqlfile "zcu106_systest_build_test" "build_test" "systest" "common"

chmod 755 $tqlfile
