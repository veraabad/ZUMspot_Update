#!/bin/bash

# Copyright (C) 2019 by Abad Vera

# Download latest firmware for ZUMspot Dualband
curl -OL https://github.com/veraabad/ZUMspot_Update/blob/master/zumspot_dualband_fw.bin

# Stop MMDVMHost process to free serial port
sudo killall MMDVMHost >/dev/null 2>&1

# Upload the firmware
sudo stm32flash -v -w zumspot_dualband_fw.bin -g 0x0 -R -i 20,-21,21:-20,21 /dev/ttyAMA0

