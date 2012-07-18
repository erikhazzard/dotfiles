# make ls display colors, reinforce with CLICOLOR and LSCOLORS
export CLICOLOR=1
 
# LSCOLORS order: DIR, SYM_LINK, SOCKET, PIPE, EXE, BLOCK_SP
# CHAR_SP, EXE_SUID, EXE_GUID, DIR_STICKY, DIR_WO_STICKY
# a = black, b = red, c = green, d = brown, e = blue,
# f = magenta g = cyan, h = light gray, x = default
# lowercase is bold
export LSCOLORS=ExFxCxDxBxegedabagacad

NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;32m\]" #change this for letter colors
ACOL="\[\033[0;34m\]" #change this for letter colors
HII="\[\033[0;32m\]" #change this for letter colors
SI="\[\033[0;34m\]" #this is for the current directory
IN="\[\033[0m\]"

source ~/.additional_bash/git-completion.bash
source ~/.additional_bash/bash_prompt
source /etc/bashrc

export PS1="$NM[ $HI\u$ACOL@$HII\h $SI\w$NM ] $IN"

alias ls='ls -lah'
alias octave="/Applications/Octave.app/Contents/Resources/bin/octave"
alias gnuplot="/Applications/Gnuplot.app/Contents/Resources/bin/gnuplot"
alias start_py_server='python -m SimpleHTTPServer'
alias grep='grep --color=auto'

alias 'watch_vis'='coffee -w -c -o static/js static/coffee'
alias vim='mvim -v'

set -o vi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash  ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash 
fi

[[ -s "/Users/erikhazzard/.rvm/scripts/rvm" ]] && source "/Users/erikhazzard/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NODE_ENV=local

alias qa2t='ssh -p 222 -L 8341:localhost:8341 -L 2181:localhost:2181 -L 15200:localhost:15200 -L 11000:localhost:11000 -L 50070:localhost:50070 -L 50030:localhost:50030 lucid@qa02.lcimg.com'
