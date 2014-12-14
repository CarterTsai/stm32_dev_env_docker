STM32 Environment with Docker
-----------------------------

References:
1. https://docs.docker.com/reference/builder
2. https://docs.docker.com/reference/builder/#from


### Install Docker on Ubuntu

```
$> sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\
$> /etc/apt/sources.list.d/docker.list"
$> sudo apt-get update
$> sudo apt-get install lxc-docker
```

### Development Environment
```
OS: Ubuntu 14.10
Docker: 1.4.0
Development Platform: STM32F429I-Discovery
```
### Build or Pull Images

1. build images
```
$> bash build.sh
```
2. pull images from docker hub
```
$> docker pull cartertsai/stm32-dev 
```

### Run Images and Example

1. Run image

```
$> sudo docker run -i -t --privileged -v /dev/bus/usb:/dev/bus/usb cartertsai/stm32-dev /bin/bash
```

2. Update firmware 

```
$> cd /home/stm32

$> arm-none-eabi-objcopy -I ihex -O binary `find -name STM32F429I-DISCOVERY_Demo_V1.0.1.hex` /tmp/out.bin

$> st-flash write /tmp/out.bin 0x8000000
```

## Enjoy it :D !!!


