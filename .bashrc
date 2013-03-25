#DEFAULT SETTINGS

clear
force_color_prompt=yes
echo -ne "${LIGHTGREEN}" "Greetings, $USER. Todays date and time is, "; date
echo -e "${RED}"; cal ;  
echo -ne "${CYAN}";
echo 
echo -ne "${RED}Sysinfo:";uptime ;echo ""
echo -ne "${LIGHTGREEN}" ; uname -sro

cd ~

#BASH SETTINGS
				
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

#anoying ones 
alias cd..='cd ..'

#PATH ALIASES
alias back='cd - > /dev/null'
alias home='cd ~'

#GIT ALIASES
alias git-protect='git update-index --assume-unchanged'
alias git-unprotect='git git update-index --no-assume-unchanged'
alias git-protected='git ls-files -v | grep "^[a-z]"'
alias git-commit='git commit -m'
alias git-diff='git diff --cached'
alias git-log="git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(white)- %an, %ar%Creset'"

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
