# dotfiles
My dotfiles in .config. Run the setup script (`setup.bash`) to get everything setup nicely. This includes some cosmetics as well as software I commonly use, like ROS and CUDA.

If you have an Nvidia GPU, you can also run the `cuda_setup.sh` script to setup CUDA.

## General Instructions
To call the install script, make sure you can run the file:
`chmod u+x ./setup.bash`

If you would like to install the i3 wm when running the install script, make sure to include the appropriate flag:
`./setup.bash --i3`

## Font Instructions
If you would like to be able to see the Unicode icons and other such symbols, make sure to follow the instructions for the font of your choice (currently it is automatically set to JetBrains Mono NL) in the NerdFonts repo:
https://github.com/ryanoasis/nerd-fonts
