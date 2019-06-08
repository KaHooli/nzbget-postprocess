FROM linuxserver/nzbget:testing
MAINTAINER KaHooli

VOLUME /scripts

# Install Git
RUN apk add --no-cache git

# Remove python2, install python3 and git, and install python libraries
RUN apk update && \
  apk upgrade && \
  apk del python2 && \
  apk add --no-cache \
    python3 \
    py3-setuptools
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install MP4 Automator
RUN git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /scripts/MP4_Automator
RUN apk add --no-cache \
  python3-dev \
  libffi-dev \
  gcc \
  musl-dev \
  openssl-dev \
  ffmpeg

# install pip, venv, and set up a virtual self contained python environment
RUN python3 -m pip install --user --upgrade pip && \
  pip3 install requests \
    requests[security] \
    requests-cache \
    babelfish \
    'guessit<2' \
    'subliminal<2' \
    'stevedore==1.19.1' \
    python-dateutil \
    qtfaststart

#Set MP4_Automator script settings in NZBGet settings
RUN echo 'NZBGetPostProcess.py:MP4_FOLDER=/scripts/MP4_Automator' >> /config/nzbget.conf
RUN echo 'NZBGetPostProcess.py:SHOULDCONVERT=True' >> /config/nzbget.conf

# Install nzbToMedia
RUN apk add --no-cache git
RUN git clone https://github.com/clinton-hall/nzbToMedia.git /scripts/nzbToMedia

#Set MP4_Automator script settings in NZBGet settings
RUN echo 'nzbToCouchPotato.py:auto_update=1' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:cpsCategory=Movie' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:cpsdelete_failed=0' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:getSubs=1' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:subLanguages=eng' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:transcode=1' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:duplicate=0' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:ignoreExtensions=' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:outputFastStart=1' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:embedSubs=0' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:extractSubs=1' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:hwAccel=1' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:outputVideoResolution=' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:outputAudioTrack2Codec=' >> /config/nzbget.conf
RUN echo 'nzbToCouchPotato.py:outputAudioOtherCodec=' >> /config/nzbget.conf
#RUN echo '' >> /config/nzbget.conf
RUN echo 'nzbToGamez.py:auto_update=1' >> /config/nzbget.conf
RUN echo 'nzbToHeadPhones.py:auto_update=1' >> /config/nzbget.conf
RUN echo 'nzbToMedia.py:auto_update=1' >> /config/nzbget.conf
RUN echo 'nzbToMylar.py:auto_update=1' >> /config/nzbget.conf
RUN echo 'nzbToNzbDrone.py:auto_update=1' >> /config/nzbget.conf
RUN echo 'nzbToSickBeard.py:auto_update=1' >> /config/nzbget.conf

#Set script file permissions
RUN chmod 775 -R /scripts

#Set script directory setting in NZBGet
#RUN /app/nzbget -o ScriptDir=/app/scripts,${MP4Automator_dir},/scripts/nzbToMedia
ONBUILD RUN sed -i 's/^ScriptDir=.*/ScriptDir=\/app\/scripts;\/scripts\/MP4_Automator;\/scripts\/nzbToMedia/' /config/nzbget.conf

#Adding Custom files
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/my_init.d/*.sh
