#  Kolton
# .zshrc

# Oh My Zsh (github/oh-my-zsh)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="afowler"
#fino-time frisk
plugins=(git screen)
DISABLE_AUTO_UPDATE=true
[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# VI Keybindings
bindkey -v
bindkey ^s history-incremental-search-forward 
bindkey ^r history-incremental-search-backward

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Don't autocorrect for me
unsetopt correct
unsetopt correct_all

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0
export VISUAL=vim
export EDITOR=vim

# Some Ant build scripts (such as apidash) expect the WORKSPACE dir to point to the p4 depot dir
export WORKSPACE=/source/depot
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home

export ANT_OPTS="-Xms2g -Xmx2g -XX:MaxPermSize=512m"
export TOMCAT_HOME=/apps/tomcat
export TOOLS=/source/netflix/wrapper
export GRADLE_HOME=/source/netflix/wrapper

alias gradlew=$TOOLS/gradlew
alias bb="gradlew clean build"
alias bbe="gradlew cleanEclipse eclipse"
alias bbp="gradlew clean build local-publish"
alias bbss="gradlew clean build -Pstatus=snapshot"

#export PROMPT="%B%n%b@%m[%T]%1v>"
#export RPROMPT="%d"
WORDCHARS=${WORDCHARS:s#/#}

alias screen='screen -xRR'
alias grepr='grep -r '
alias la='ls -la'
alias lt='ls -lart'

alias resource='source ~/.zshrc'
alias tailf='tail -f -n 100'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

alias findtomcat='netstat -tlee | grep "8[0-9]\{3\}"'
alias findtom='ps aux | grep tomcat'
alias killtom="ps aux | grep tomcat | awk '{print \$2}' | xargs kill -9"

alias u='cd ../'
alias uu='cd ../../'
alias uuu='cd ../../../'
alias uuuu='cd ../../../../'
alias uuuuu='cd ../../../../..'

# cd short cuts
alias cdserver='cd /source/edge/server'
alias cdfit='cd /source/edge/fit'
alias cdfiti='cd /source/edge/fit-impl'
alias cdfits='cd /source/edge/fit-service'
alias cdfitd='cd /source/edge/fit-decorator'
alias cdfitc='cd /source/edge/fit-client'
alias cdfitw='cd /source/edge/fit-website'
alias cdzuul='cd /source/edge/edgezuul'
alias cdtools='cd /source/edge/tools/'
alias cdatf='cd /source/edge/atf/'
alias cdedge='cd /source/edge/edgecenter/'
alias cdevents='cd /source/edge/tools/events'
alias cdhystrix='cd /source/open/Hystrix'
alias cdlogs='cd /apps/tomcat/logs'
alias netflix='~/snippets/nrdp/gibbon/netflix'

alias startapi='~/snippets/edge/api_startup.sh'
alias startedge='~/snippets/edge/api_startup_inline.sh'
alias startdash='~/snippets/edge/dash_startup.sh'
alias startfit='/source/edge/fit-service/conf/system/setenv-dev.sh'
alias stopfit='$TOMCAT_HOME/bin/catalina.sh stop'
alias startzuul='~/snippets/edge/zuul_startup.sh'

export FIT='fit.netflix.net:7101'
export FIT_TEST='fit.us-west-2.dyntest.netflix.net:7101'

export DESKTOP='lgud-kolton.corp.netflix.com'

grepi(){
   grep -r -n --include="$1" $2 $3
}

# Find, follow links, short cut all the . -name BS
findl() {
    find -L . -name "$1"
}

# Find Grep!
findg(){
     find -L . -name "$1" | xargs grep -r "$2"
}

# Common functionality
alias findwar='findl "*.war"'
alias cleanwar='rm -rf $TOMCAT_HOME/webapps/ROOT*'
alias cleantom='rm -rf $TOMCAT_HOME/work/*'
alias cleangibbon='rm -rf /apps/gibbon/data/var/nrd/*'

copywar() {
    cp "$1" $TOMCAT_HOME/webapps/ROOT.war
}

fitstatus(){
    for file in /source/edge/fit*
    do 
       echo -e "\n\e[1;36m$file"; tput sgr0; cd $file;
       if [[ $(git status) == *ahead* || $(git status) != *clean* ]]
       then git status
       fi

    done
}

function switchjdk () {
    if [[ "$1" == "1.6" || "$1" == "1.7" || "$1" == "1.8" ]]; then
        export JAVA_HOME=`/usr/libexec/java_home -v $1`
        elif [[ "$1" == "groovy1.7" ]]; then
        export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home"
    else
        echo "switchjdk currently lets you choose between 1.6 and 1.7 and 1.8"
        fi
}

function startFitEsn () {
     curl -i -X POST "$FIT/v1/sessions/new/s/$1?esn=$2"
}

function startFitCid () {
     curl -i -X POST "$FIT/v1/sessions/new/s/$1?cid=$2"
}

function endFitEsn () {
     curl -i -X POST "$FIT/v1/sessions/end?esn=$1"
}

function endFitCid () {
     curl -i -X POST "$FIT/v1/sessions/end?cid=$2"
}

[[ -s "~/.zsh_netflix" ]] && source "~/.zsh_netflix"
