FROM ubuntu:14.04

RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common python-software-properties
RUN sudo add-apt-repository ppa:terry.guo/gcc-arm-embedded
RUN sudo apt-get install -y git
RUN sudo apt-get install -y gcc-arm-none-eabi

RUN sudo apt-get install -y automake* libtool libusb-1.0-0-dev pkg-config build-essential
RUN git clone http://github.com/texane/stlink.git
RUN cd stlink && aclocal -I /usr/share/aclocal && ./autogen.sh && ./configure --prefix=/usr &&  make && sudo make install && sudo cp 49-stlinkv2.rules /etc/udev/rules.d/

RUN sudo apt-get install -y texi2html texinfo
RUN git clone git://git.code.sf.net/p/openocd/code openocd
RUN cd openocd && ./bootstrap && ./configure --prefix=/usr --enable-stlink && make && sudo make install

# get 
RUN apt-get install -y wget
RUN cd /home && mkdir stm32 && cd stm32 && wget http://www.st.com/st-web-ui/static/active/en/st_prod_software_internet/resource/technical/software/firmware/stsw-stm32138.zip
RUN apt-get install unzip
RUN cd /home/stm32 && unzip stsw-stm32138.zip
RUN apt-get install -y vim
RUN cd /home/stm32 && arm-none-eabi-objcopy -I ihex -O binary `find -name STM32F429I-DISCOVERY_Demo_V1.0.1.hex` /tmp/out.bin
RUN rm /home/stm32/stsw-stm32138.zip
RUN sudo apt-get install -y gdb-arm-none-eabi
