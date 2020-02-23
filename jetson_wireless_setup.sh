#!/bin/bash

URL="https://github.com/Mange/rtl8192eu-linux-driver.git"

#git clone wireless driver
git --version > /dev/null
if [ $? -eq 0 ]
then
	git clone $URL
else
	sudo apt update
	sudo apt install git
	git clone $URL
fi

cd rtl8192eu-linux-driver
GCC_PATH=`which gcc`
export ARCH=arm64
export CROSS_COMPILE=$GCC_PATH

make
if [ $? -eq 0 ]
then 
	echo "Failed to compile source code."
else
	sudo make install
	if [ $? -eq 0 ]
	then
		echo "Wireless driver successfully install."
	else
		echo "Failed to install wireless driver."
	fi
fi

