Aims for this Docker image:
* [ ] Install NZBGet *(using linuxserver/nzbget image)*
* [ ] Install [MP4 Automator script](https://github.com/mdhiggins/sickbeard_mp4_automator)
  * [ ] Config file to be generated at volume at /config
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
* [ ] Install [nzbToMedia script](https://github.com/clinton-hall/nzbToMedia)
  * [ ] Dependancies
    * [x] p7zip *(installed with NZBGet image)*
    * [x] FFmpeg *(installed with MP4 Automator)*
