#
# ~/.bash_profile
#

DATETIME=$(date +"%Y-%m-%d-%H-%M-%S")

# load the .bashrc file, if it exists
[[ -f ~/.bashrc ]] && . ~/.bashrc

# start sway on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	#export WLR_DRM_DEVICES=/dev/dri/card1
	exec sway
	#exec sway --debug 2> "${HOME}/sway1-${DATETIME}.log"
fi
