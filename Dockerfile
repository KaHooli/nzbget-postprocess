FROM linuxserver/nzbget
MAINTAINER KaHooli

# Install MP4 Automator
ARG MP4Automator_dir="/scripts/mp4_automator/"
RUN apk add --no-cache git && \
  git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git ${MP4Automator_dir}

# Install nzbToMedia
ARG nzbToMedia_dir="/scripts/nzbToMedia/"
RUN apk add --no-cache git && \
  git clone https://github.com/clinton-hall/nzbToMedia.git ${nzbToMedia_dir}

#Set script file permissions
RUN chmod 775 -R /scripts

#Set script directory setting in NZBGet
RUN /app/nzbget -o ScriptDir=/app/scripts,${MP4Automator_dir},${nzbToMedia_dir}

#Adding Custom files
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh
