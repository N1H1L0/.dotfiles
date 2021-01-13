# 256 color support see here: http://www.mail-archive.com/bug-coreutils@gnu.org/msg11030.html)

NORMAL 00                     # global default
FILE 00                       # normal file
DIR 38;5;141                  # directory default blue ex
LINK 38;5;213                 # symbolic link.  (If you set this to 'target' instead of a  numerical value, the color is as for the file pointed to.)
SOCK 42                       # socket 
FIFO 33                       # pipe 
EXEC 38;5;124                 # executable 
BLK 34;46                     # block special 
CHR 34;43                     # character special 
SETUID 30;41                  # executable with setuid (u+s) bit set 
SETGID 30;36                  # executable with setgid (g+s) bit set 
STICKY_OTHER_WRITABLE 30;42   # directory writable to others (+t,o+w), with sticky bit 
OTHER_WRITABLE 30;43          # directory writable to others (o+w), without sticky bit 

