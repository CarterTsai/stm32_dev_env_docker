STM32 Environment with Docker
-----------------------------
### References: 

1. https://docs.docker.com/reference/builder  
2. https://stm32f429.hackpad.com/NOTE-WbiooOfkaoR  

### Development Environment
```
OS: Ubuntu 14.10
Docker: 1.4.0
Development Platform: STM32F429I-Discovery
```

### Install Docker on Ubuntu

```
$> sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\
 /etc/apt/sources.list.d/docker.list"
$> sudo apt-get update
$> sudo apt-get install lxc-docker
```

### Build or Pull Images

1. build images
```
$> bash build.sh
```
or pull images from docker hub
```
$> docker pull cartertsai/stm32-dev 
```

### Run Images and Example

* Run image

```
$> mkdir app
$> bash run.sh 
or 
$> sudo docker run -i -t --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD/app:/home/stm32/app cartertsai/stm32-dev /bin/bash
```

* Connect your device and Update firmware

```
$> cd /home/stm32

$> st-flash write /tmp/out.bin 0x8000000
```

## Enjoy it :D !!!


