# $OpenBSD: dot.profile,v 1.8 2022/08/10 07:40:37 tb Exp $
#
# sh/ksh initialization

umask 077

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
export PS1='\W $(git branch 2> /dev/null | grep "^*" 2> /dev/null)\n> '
TERM=screen
export PATH HOME TERM
set -o vi

export LC_CTYPE="hu_HU.UTF-8"

cat ~/.reminder

