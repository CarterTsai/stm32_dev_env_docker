#!/bin/bash

sudo docker run -i -t --privileged -v /dev/bus/usb:/dev/bus/usb cartertsai/stm32-dev /bin/bash
