#!/bin/sh

FILE="$DEMO_HOME/csv/petalinux/zcu102/zcu102.csv"

##### Generating csv file for plnx run #####                                    
# EXAMPLE ENTRY: <test name> <variance> <test directory> <priority> <prebuild/build> <module> <super suite> <test suite> <regression type> <regression subtype>
##### SYSTEST KERNEL #####                                                      
/bin/cat <<EOM >$FILE
test_name,variance,test_dir,priority,component,ssuite,tsuite,reg_type,reg_subtype,catagory
canps,systest,kernel,1,prebuild,kernel,canps,daily,functional,common_tests
cputest,systest,kernel,1,prebuild,kernel,cputest,daily,functional,common_tests
dma,systest,kernel,1,prebuild,kernel,dma,daily,functional,common_tests
ethernet,systest,kernel,1,prebuild,kernel,ethernet,daily,functional,common_tests
fpga_manager,systest,kernel,1,prebuild,kernel,fpga_manager,daily,functional,common_tests
gpio,systest,kernel,1,prebuild,kernel,gpio,daily,functional,common_tests
hotplug,systest,kernel,1,prebuild,kernel,hotplug,daily,functional,common_tests
i2c,systest,kernel,1,prebuild,kernel,i2c,daily,functional,common_tests
netboot,systest,kernel,1,prebuild,kernel,netboot,daily,functional,common_tests
openAMP,systest,kernel,1,prebuild,kernel,openAMP,daily,functional,common_tests
qspi,systest,kernel,1,prebuild,kernel,qspi,daily,functional,common_tests
rtc,systest,kernel,1,prebuild,kernel,rtc,daily,functional,common_tests
sata,systest,kernel,1,prebuild,kernel,sata,daily,functional,common_tests
sd,systest,kernel,1,prebuild,kernel,sd,daily,functional,common_tests
swdt,systest,kernel,1,prebuild,kernel,swdt,daily,functional,common_tests
timer,systest,kernel,1,prebuild,kernel,timer,daily,functional,common_tests
usb,systest,kernel,1,prebuild,kernel,usb,daily,functional,common_tests
EOM
