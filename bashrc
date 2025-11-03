PROMPT_DIRTRIM=3
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h \[\033[01;34m\]\w\[\033[00m\]\$ '
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS -h'
alias ll='ls $LS_OPTIONS -lh'
alias la='ls $LS_OPTIONS -lAh'
alias rm='rm -iv'
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
