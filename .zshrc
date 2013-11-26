#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# VI Keybindings
bindkey -v 

# Oh My Zsh (github/oh-my-zsh)
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="frisk"
plugins=(git,screen)
[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

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
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export ANT_OPTS="-Xms2g -Xmx2g -XX:MaxPermSize=512m"
export TOMCAT_HOME=/source/depot/Tomcat7.0.39/
#export PROMPT="%B%n%b@%m[%T]%1v>"
#export RPROMPT="%d"
#export MANPATH=/apollo/env/Emacs23/man:$MANPATH
#export INFOPATH=/apollo/env/Emacs23/share/info:$INFOPATH
WORDCHARS=${WORDCHARS:s#/#}

#Netflix testing cookies
export TEST_COOKIE="NetflixIdTest=v%3D2%26mac%3DAQEAEAABABQQBwa6In1Bn5P7yPahnyb0UBDWBnUpSMo.%26ch%3DAQEAEAABABQog1zjfa9_F8UXSQMnpUoobVq_awF_KHA.%26ct%3DBQAOAAEBELMlguUw95xafVAhGXh6L6-CUIs6eDEvtwcmTfh2XVbzx_C4-a0IADrpqt-3z1XWpGbGDXrNDeXRoXEbUi67eVboeg8YO597tt4wSXPxOThEO4TeMUq8ufuevLOdipG2H_MLId_35f949nnmCyTW8YopBgqdjDvdSmrDiEk3aMCU5M8qC3kggtqJKYqA7kUIPPG45CBiaimPMN0eBHS9FzcvyJwA9gruRq3B-A3hKlT5OCZf_aAlgq-sw7P8cgvkdUmjApV7xswQ2V6S6esgfziGw1YDOF0lmWfmZ_XOK6QSfGxhqIlbeJnmjrRI8TfpeL8mC1PfrQINqmjsbwK6ni57l3O_aYVuF9GwqWocyqk-FJWgsSdL-m7E-HjE8-xx3xuETCR307S-I2ii0KBDRXsycpCp8vPPSp11nH7TOx1Rpiep9F9P4uelFxusezp0swxBF3EoYBKB7aa3Nf_f5I0gl1dPMeZlhz9W_MySdyV5cCXW14ebFNxhuTlhZYZtQyQkL8fTAXetEP_scTBOvm2Nm6U602TVoRl1ybjgTkxz7r2RjvibwcMyBHSXOrs7j-6wJ9dSmmq5LOLqFLsiv0TD-slQxgFygPw5fUqLBxYvpiqM63sCj65IrEMj45kIH9FxiWuxKt1cxdi8I5czYCDLzkQ9-qcruzekESqjt%3Ddbl; SecureNetflixIdTest=v%3D2%26mac%3DAQEAEQABABQ55VzpZSOL9HS7A-f9f1QLFLRe2q_XApY.%26dt%3D1384281121811;"
export TEST_USER="BQAJAAEDEBTbWoUioEXPaI5O86YhVAUgHofBnFAfY_L6j7HEu8sg4Qhk9iGIl8KiwBekzOHQbRs."

alias grepr='grep -r '
alias la='ls -la'
alias lt='ls -lart'
alias resource='source ~/.zshrc'
alias reup='git pull --rebase'
alias rmrt='find . -name "*~" -exec rm -f {} \; -o -name "#*#" -exec rm -f {} \;'
alias screen='screen -xRR'
alias tailf='tail -f -n 100'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias findtomcat='netstat -tlee | grep "8[0-9]\{3\}"'

alias u='cd ../'
alias uu='cd ../../'
alias uuu='cd ../../../'
alias uuuu='cd ../../../../'
alias uuuuu='cd ../../../../..'

# cd short cuts
alias cdp='cd /home/kolton/Perforce/p4kolton/depot/webapplications/OpenAPI/prod'
alias cdtom='cd $TOMCAT_HOME'
alias cdtl='cd $TOMCAT_HOME/logs'

grepi(){
   grep -r -n --include="$1" $2 $3
}

findl() {
    find -L . -name "$1"
}

