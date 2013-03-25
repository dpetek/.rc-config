#DEFAULT SETTINGS
cd ~

#BASH SETTINGS
force_color_prompt=yes
EDITOR=vim
###################################
	#ALIASES#
####################################

#APT-GET STUFF
alias apt-install='sudo apt-get install'
alias apt-remove='sudo apt-get remove'
alias apt-cleanup='sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean && sudo apt-get remove'
alias update-system='sudo apt-get update;sudo apt-get upgrade'
alias apt-search='apt-cache search'
alias apt-show='apt-cache show'
alias apt-update-distro='sudo apt-get update && sudo apt-get dist-upgrade'

alias h='history | grep $1'
alias aliaslist='grep alias ~/.bashrc'
#anoying one! 
alias cd..='cd ..'

#PATH ALIASES


#CUSTOM SCRIPTS

#enable bash completition
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}
