# Baldur's Gate 3 Patterns for ImHex
This repository contains research for various (file) formats used in BG3, most notably the `LSMF` used as part of the `NewAge`-block in the saves.

# Requirements
You need at least [ImHex v1.31.0](https://github.com/WerWolv/ImHex/releases), which adds support for the `[[hex::group]]`-attribute used in the the patterns.

# Setup ImHex
1. Clone this repository somewhere on your system
2. Open ImHex and go to "Settings > Folders"
3. Add the `ImHex`-folder in the repository to that list.

# Extracting saves
A tool is included under the `Src`-folder, which can extract the `NewAge`-block from any save. Grab a pre-compiled version from the Releases if you don't want to compile it yourself.

On Windows, simply drag/drop your .lsv save-file onto the executable. 

On other systems, use a terminal as follows: 
```
BG3.Extractor Save.lsv NewAge.lsmf
```

The first argument is the input save-file, the second is the output location of the .lsmf file.

# Using the LSMF format
1. Extract a `NewAge`-block from one of your saves
2. In ImHex, use "File > Open File..." to load it up
3. In the "Pattern editor", enter the following:
```c
#pragma pattern_limit 1000000

#define BASE_OFFSET 48

#include <bg3/lsmf.pat> 

LSMF lsmf @ 0x0;

printNamesEntries(lsmf);
```
4. Evaluate the pattern and the "Pattern Data" should contain all information the pattern is currently able to understand.

# Dependencies
- [.NET 6 version](https://github.com/LennardF1989/lslib/tree/dotnet6) of [LSLib](https://github.com/Norbyte/lslib) to extract resources from save-files.