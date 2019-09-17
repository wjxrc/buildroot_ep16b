#bin/bash
#make  ep16b_rootfs_defconfig
#make menuconfig
cp .config ../uboot/u-boot-2016.01/bak/buildroot_ep16b_config
make -j2
if [[ $1 = "initram" ]]; then
	echo "initramfs"
	rm -rf output/images/rootfs5/
	mkdir -p output/images/rootfs5
	tar -xvf output/images/rootfs.tar  -C output/images/rootfs5
	cd output/images/rootfs5/dev
	sudo mknod -m 666 console  c 5 1 
	sudo mknod -m 666 null  c  1  3
	cd ../../../../
	echo "ok"
elif [[ $1 = "ubi" ]]; then
	echo "ubi"
	rm -rf output/images/rootfs/
	mkdir -p output/images/rootfs
	tar -xvf output/images/rootfs.tar  -C output/images/rootfs
#	rm -rf output/images/rootfs/bin/ps
	cd output/images/rootfs/dev
	#sudo mknod -m 666 console  c 5 1 
	#sudo mknod -m 666 null  c  1  3
	cd ../../	
	rm -rf  rootfs_ep16b.tar
	tar -czvf rootfs_ep16b.tar rootfs
	cp rootfs_ep16b.tar ../../rootfs.tar.bz2
	cd ../../
	echo "ok"
	
else
	echo "dfdf"	
fi
	

