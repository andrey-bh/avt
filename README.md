# VideoTool by ARAKL

[![Release](https://img.shields.io/github/v/release/andrey-bh/avt)](https://github.com/andrey-bh/avt/releases)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-success)
[![License](https://img.shields.io/github/license/andrey-bh/avt)](LICENSE)

**VideoTool (`avt`)** is a lightweight and flexible command-line tool for working with audio tracks in video files.

You can add, replace, or convert audio tracks (e.g., to AC3) using a simple CLI interface.

---

## Installation

### MacOS / Linux (via [Homebrew](https://brew.sh/))

```
brew tap andrey-bh/avt https://github.com/andrey-bh/avt
brew install andrey-bh/avt/avt
```

### Windows

1. Download the latest installer from the [Release page](https://github.com/andrey-bh/avt/releases)
2. Run the installer
```
avt-installer-<version>.exe
```
3. After installation, open a new Command Prompt and run:
```
avt --help
```

## Usage

```
Usage: avt [options]
-b <count>           Audio bit rate (192K by default)
-t <name>            Track title
-v                   Version number
-a <pattern>         Audio file pattern (path|filename|name|ext)
-f <file>|<mask>     Video file or mask
-h, --h              This help
-l <code>            Track language (en, ru, etc.)
-n <number>          Audio track number for converting (0 by default)
-D <path>            Output directory

--addAudio           Add audio to video
--replaceAudio       Replace all audio tracks of the video with the audio file
--toAC3              Converting audio track to AC3
```

## Examples

**Add an audio track to a video**
```
avt -f "Movie.mkv" -a "Sound.mka" -D "DEST" --addAudio
```

**Replace all existing audio tracks**
```
avt -f "Movie.mkv" -a "Sound.mka" -D "DEST" --replaceAudio
```

**Convert to AC3**
```
avt -f movie.mp4 -D "DEST" --toAC3
```

**Bulk adding audio tracks for the corresponding video list by mask**
```
avt -f "*.mkv" -a "Sound/{{name}}-en.mka" -b 192 -l "en" -t "Custom Sound Track" -D "DEST" --addAudio
```

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve this tool.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
