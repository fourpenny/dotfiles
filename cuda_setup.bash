# Become root because it's more convienent
if [ $UID -ne 0 ]; then
	echo "-- Becoming root"
	exec sudo $0 $@
fi
# Copied from the CUDA quick start guide
# https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html
# Run at your own risk :)
# Don't forget to check that you have a compatible distro and kernel version
dpkg -i cuda-repo-<distro>_<version>_<architecture>.deb
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/7fa2af80.pub
apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.0-1_all.deb
dpkg -i cuda-keyring_1.0-1_all.deb
add-apt-repository contrib
apt-get update
apt-get -y install cuda
echo "CUDA preliminary setup complete! Don't forget to reboot! :)"

