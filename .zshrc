#  Kolton
# .zshrc
autoload -U colors && colors
autoload -U compinit
compinit
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'

# Don't autocorrect for me
unsetopt correct
unsetopt correct_all

#Don't prompt for rm *
setopt rmstarsilent
#setopt correctall

# export a prompt to get eaten for non-oh-my-zsh boxes
#export PROMPT="%B$fg[blue]%n@%b$fg[red]%M $fg[yellow]* $fg[green]%d %B$fg[white]%T%b> "
export PROMPT="%m %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[green]}%}%3~ %{${fg_bold[blue]}%}»%{${reset_color}%} "

#Oh My Zsh (github/oh-my-zsh)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="afowler"
#afowler fino-time frisk
plugins=(git screen gradle)
DISABLE_AUTO_UPDATE=true
[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# VI Keybindings
bindkey -v
bindkey ^s history-incremental-search-forward 
bindkey ^r history-incremental-search-backward

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line
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
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home

export ANT_OPTS="-Xms2g -Xmx2g -XX:MaxPermSize=512m"
export TOMCAT_HOME=/apps/tomcat
export TOOLS=/source/netflix/wrapper
export GRADLE_HOME=/source/netflix/wrapper

alias python="/usr/local/bin/python3.4"
alias gradlew=$TOOLS/gradlew
alias bb="gradlew clean build"
alias bbe="gradlew cleanEclipse eclipse"
alias bbp="gradlew clean build local-publish -Pstatus=snapshot"
alias bbss="gradlew clean build -Pstatus=snapshot"
alias bad="bb && copywar && startfit"

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
alias cleanup="killtom || cleanwar"

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
alias cdldfi='cd /source/edge/fit-ldfi'
alias cdidl='cd /source/edge/Ribbon-IDL'
alias cdhelix='cd /source/edge/helix'
alias cdfbc='cd /source/edge/hystrix-fallback-cache'
alias cdmantis='cd /source/edge/fit-mantis'
alias netflix='~/snippets/nrdp/gibbon/netflix'

alias startapi='~/snippets/edge/api_startup.sh'
alias startedge='~/snippets/edge/api_startup_inline.sh'
alias startdash='~/snippets/edge/dash_startup.sh'
alias startfit='/source/edge/fit-service/root/apps/tomcat/bin/setenv-dev.sh'
alias stopfit='$TOMCAT_HOME/bin/catalina.sh stop'
alias startzuul='~/snippets/edge/zuul_startup.sh'

export FIT='fit.netflix.net'
export FIT_TEST='fit.test.netflix.net'

export DESKTOP='lgud-kolton.corp.netflix.com'

export NF_IDFILE=/Users/kolton/idfile
export NF_DPI_VIDEO_PLUGIN=x11;
export NF_DISK_CACHE_CAPACITY=0;
export NF_TRACE_AREAS=ui,nccp

alias findwifi="netstat -nr | grep default | head -n 1 | awk -F ' ' '{print $2}'"

clearwifi(){
    sudo route delete $1
}

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
alias findjar='findl "*.jar"'
alias cleanwar='rm -rf $TOMCAT_HOME/webapps/ROOT* && rm -rf $TOMCAT_HOME/work/*'
alias cleannode='rm -rf tmp/ node_modules/ bower_components/ dist/'
alias cleancache='bower cache clean && npm cache clean'
alias npmi='npm install; bower install'

copywar() {
    find -L . -name "*.war" -exec cp {} $TOMCAT_HOME/webapps/ROOT.war \;
}

fcwar(){
    find -L . -name "*.war" | xargs cp -t $TOMCAT_HOME/webapps/ROOT.war
}

fitstatus(){
    pushd `pwd` > /dev/null
    for file in /source/edge/fit*
    do 
       echo -e "\n\e[1;36m$file"; tput sgr0; cd $file;
       if [[ $(git status) == *ahead* || $(git status) != *clean* ]]
       then git status
       fi

    done
    popd > /dev/null
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

preexec () {
  echo -ne "\ek${1%% *}\e\\"
}

[[ -e "$HOME/.zsh_netflix" ]] && source "$HOME/.zsh_netflix"

export NVM_DIR="/Users/kolton/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
