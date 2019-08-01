# chernobot

| Build | Status |
| ----- | ----- |
| Travis CI | [![Build Status](https://travis-ci.com/sas-mate-robotics/chernobot.svg?branch=master)](https://travis-ci.com/sas-mate-robotics/chernobot) |
| Drone CI | [![Build Status](https://ghdrone.garykim.dev/api/badges/sas-mate-robotics/chernobot/status.svg)](https://ghdrone.garykim.dev/sas-mate-robotics/chernobot) |

A one-size-fits-all program for Singapore American School's MATE program, written in C++17. Undergoing heavy restructuring!

## Getting Started

### Automatic Script

If you are on a macOS, Ubuntu, or Ubuntu like system, you can run the following command to automatically install chernobot. The following script will automatically check dependencies, install or prompt to install missing dependencies, compile the program.

```
curl -sSL --output chernobotinstaller.sh https://raw.githubusercontent.com/sas-mate-robotics/chernobot/master/install.sh && grep '#!/bin/bash' chernobotinstaller.sh > /dev/null && bash ./chernobotinstaller.sh dl
```

### macOS

You'll need the latest version of Clang for C++17, SDL2, Ninja (optional), CMake, and various other tools.

If you haven't already, install the XCode Developer Tools with:

```
xcode-select install
```

Install [Homebrew at brew.sh](brew.sh), then:

```
brew install sdl2 ninja cmake opencv
```

You can install and run this program from the root directory by: (You can substitute `Ninja` with `"Unix Makefiles"`)

```
mkdir tmp
cd tmp
cmake .. -GNinja
ninja install
../chernobot
```

### MATE 2019

Functionality that is needed to be implemented:
- Measuring water temperature
- FFMPEG video capture
- Shape recognition with OpenCV + OVERLAY

Add: Documentation, containing an algo. desc. and a data flow diagram.

Functionality that would be nice to implement:
- Something with parallax, accelerometry, and length measurement.

### License

Relicensed to [GPL-3.0-only](/LICENSE)

* Copyright © 2018-2019 Aaron Yeoh Cruz

* Copyright © 2019 Gary Kim &lt;<gary@garykim.dev>&gt;

Originally licensed under [MIT](/OLDLICENSE): 

Copyright © 2018-2019 Aaron Yeoh Cruz

<https://github.com/hyperum/chernobot>