Aims for this Docker image:
* [ ] Install NZBGet *(using [linuxserver/nzbget](https://hub.docker.com/r/linuxserver/nzbget/) image)*
* [ ] Install [MP4 Automator](https://github.com/mdhiggins/sickbeard_mp4_automator) script
  * [ ] Dependancies:
    * [x] Python 2.7 *(installed with NZBGet image)*
      * [ ] setup_tools
      * [ ] *PIP install*
        * [ ] requests
        * [ ] requests[security]
        * [ ] requests-cache
        * [ ] babelfish
        * [ ] "guessit<2"
        * [ ] "subliminal<2"
        * [ ] qtfaststart
    * [ ] FFmpeg
  * [ ] Add script directory to [NZBGet *ScriptDir* setting](https://github.com/nzbget/nzbget/issues/181)
  * [ ] Config file to be generated at volume at /config
  * [ ] Automate updating of script
* [ ] Install [nzbToMedia](https://github.com/clinton-hall/nzbToMedia) script
  * [ ] Dependancies
    * [x] p7zip *(installed with NZBGet image)*
    * [x] FFmpeg *(installed with MP4 Automator)*
    * [x] git *(installed with NZBGet image)*
    * [ ] Add script directory to [NZBGet *ScriptDir* setting](https://github.com/nzbget/nzbget/issues/181)
