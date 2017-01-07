FROM linuxserver/nzbget
MAINTAINER KaHooli

# Install Git
RUN apk add --no-cache git

# Install MP4 Automator
RUN  git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /scripts/mp4_automator && \
  apk add --no-cache py-setuptools py-pip && \
  pip install --upgrade PIP && \
  pip install requests && \
  pip install requests[security] && \
  pip install requests-cache && \
  pip install babelfish && \
  pip install "guessit<2" && \
  pip install "subliminal<2" && \
  pip install qtfaststart

#Set MP4_Automator script folder in NZBGet settings
RUN grep -q -F 'NZBGetPostProcess.py:MP4_FOLDER=' /config/nzbget.conf && \
  || echo 'NZBGetPostProcess.py:MP4_FOLDER=/scripts/MP4_Automator' >> foo.bar && \
  && sed -i 's/^NZBGetPostProcess.py:MP4_FOLDER=.*/NZBGetPostProcess.py:MP4_FOLDER=\/scripts\/MP4_Automator/' /config/nzbget.conf

#Check if MP4 Automator config exists in /config, copy if not
RUN [[ ! -e /config/autoProcess.ini ]] && cp /scripts/MP4_Automator/autoProcess.ini.sample /config/autoProcess.ini && \
  ln -s /config/autoProcess.ini /scripts/MP4_Automator/autoProcess.ini


# Install nzbToMedia
RUN apk add --no-cache git && \
  git clone https://github.com/clinton-hall/nzbToMedia.git /scripts/nzbToMedia

#Set script file permissions
RUN chmod 775 -R /scripts

#Set script directory setting in NZBGet
#RUN /app/nzbget -o ScriptDir=/app/scripts,${MP4Automator_dir},/scripts/nzbToMedia
RUN sed -i 's/^ScriptDir=.*/ScriptDir=\/app\/scripts;\/scripts\/MP4_Automator;\/scripts\/nzbToMedia/' /config/nzbget.conf

#Adding Custom files
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh
