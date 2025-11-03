PROMPT_DIRTRIM=3
PS1="\\[\\e[38;2;255;128;0m\\]★\\[\\e[0m\\] \\[\\e[38;2;235;203;139m\\]\\t\\[\\e[0m\\] \\[\\e[38;2;128;0;204m\\]\\u\\[\\e[0m\\]\\[\\e[38;2;255;220;255m\\]@\\[\\e[0m\\]\\[\\e[38;2;128;0;255m\\]\\H\\[\\e[0m\\] \\[\\e[38;2;255;128;0m\\]→\\[\\e[0m\\]  \\w \\[\\e[38;2;0;255;0m\\]\\\$\\[\\e[0m\\]"
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS -h'
alias ll='ls $LS_OPTIONS -lh'
alias la='ls $LS_OPTIONS -lAh'
alias rm='rm -iv'
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
