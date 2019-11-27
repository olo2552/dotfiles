# fix hidpi problems
alias spotify="/usr/bin/spotify --force-device-scale-factor=2.2"

# autoload the default database
alias keepassxc="keepassxc ~/repos/keepassDB/Passwords.kdbx"

# let the user decide what to do in terms of screenshot
alias gnome-screenshot="gnome-screenshot -i"

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# Make fragile commands verbose and more safe
alias mv='mv -vi'
alias cp='cp -vi'
alias ln='ln -vi'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Enable resuming downloads
alias wget='wget -c'

# human-readable sizes2
alias df='df -h' 

# show sizes in MB
alias free='free -m'

# make it easier working with transmission cli
alias tsm="transmission-remote"
