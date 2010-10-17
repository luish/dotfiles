# ~/.bashrc

export PATH=$PATH:/home/lh/bin:/usr/local/bin

# colors
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

#PS1='[\u@\h \W]\$ '
#export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
#export PS1="\[${bldgrn}\][\u@\h ${bldwht}\w${bldgrn}]\$\[${txtrst}\] "
#export PS1="\n\[${bldcyn}\][\u@\h] ${bldwht}\w${bldcyn}\n>\[${txtrst}\] "
export PS1="\n\[${bldcyn}\]\u@\h ${bldwht}\w${bldcyn}\n>\[${txtrst}\] "
#export PS1="\n${bldgrn}@\h ${bldwht}\w${bldgrn}\n>\[${txtrst}\] "
#PS1='\[\033[36m\]\u@\h:\w\$\[\e[0m\] '

alias ll='ls -lFGA'
alias ls='ls -F --color=auto'
alias la='ls -lhFA --color=auto'
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'

alias grep='grep --color=always'
alias egrep='egrep --color=always'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet'
alias pg='ps -Af | grep $1'         # requires an argument

alias cd..='cd ..'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'

complete -cf sudo

# Instalacao das Funcoes ZZ (www.funcoeszz.net)
source /developer/apps/funcoeszz-8.10.sh
export ZZPATH=/developer/apps/funcoeszz-8.10.sh

# privileged access
if [ $UID -ne 0 ]; then
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias reboot='sudo reboot'
fi

# better video quality
alias mplayer='mplayer -vf spp,hqdn3d,pp=de'

## functions

# mkdir X && cd X
function mkcd() { mkdir "$1" && cd "$1"; }

# x - archive extractor
# usage: x <file>
x ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# calc - simple calculator
# usage: calc <equation>
function calc() { echo "$*" | bc; }

# pacman colors
alias pacs="pacsearch"
pacsearch () {
       echo -e "$(pacman -Ss $@ | sed \
       -e 's#core/.*#\\033[1;31m&\\033[0;37m#g' \
       -e 's#extra/.*#\\033[0;32m&\\033[0;37m#g' \
       -e 's#community/.*#\\033[1;35m&\\033[0;37m#g' \
       -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' )"
}

# do my work more fast

alias compjr_db="mysql -u compjunior -pcmpjnr321"
alias compjr_dbestoque="mysql -h 72.29.70.171 -u compjuni_estoque -pestoque compjuni_estoque"
alias gmailcheck="perl ~/.conky/scripts/gmail.pl s"
alias www="cd /srv/http"
alias t=todo.sh
alias todo=todo.sh
