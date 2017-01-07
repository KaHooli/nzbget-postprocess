Aims for this Docker image:
* [x] Install NZBGet *(using [linuxserver/nzbget](https://hub.docker.com/r/linuxserver/nzbget/) image)*
* [x] Install [MP4 Automator](https://github.com/mdhiggins/sickbeard_mp4_automator) script
  * [ ] Dependancies:
    * [x] Python 2.7 *(installed with NZBGet image)*
      * [x] setup_tools
      * [x] *PIP install*
        * [x] requests
        * [x] requests[security]
        * [x] requests-cache
        * [x] babelfish
        * [x] "guessit<2"
        * [x] "subliminal<2"
        * [x] qtfaststart
    * [ ] FFmpeg
  * [x] Add script directory to [NZBGet *ScriptDir* setting](https://github.com/nzbget/nzbget/issues/181)
  * [x] Config file to be generated at volume at /config
  * [ ] Automate updating of script *(currently updated when container restarted)*
* [x] Install [nzbToMedia](https://github.com/clinton-hall/nzbToMedia) script
  * [x] Dependancies
    * [x] p7zip *(installed with NZBGet image)*
    * [x] FFmpeg *(installed with MP4 Automator)*
    * [x] git *(installed with NZBGet image)*
    * [x] Add script directory to [NZBGet *ScriptDir* setting](https://github.com/nzbget/nzbget/issues/181)
