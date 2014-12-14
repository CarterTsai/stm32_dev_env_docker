#!/bin/bash

sudo docker run -i -t --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD/app:/home/stm32/app cartertsai/stm32-dev /bin/bash
