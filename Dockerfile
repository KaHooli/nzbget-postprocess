FROM linuxserver/nzbget
MAINTAINER KaHooli




#Adding Custom files
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh
