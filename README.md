# sdl2-configs
CMake config files for finding SDL2, SDL2_image, SDL2_mixer and SDL2_ttf. 

## Why?
Some (all?) systems don't have CMake configs for SDL2_image, SDL2_mixer and
SDL2_ttf. Further, even though SDL2 ships with CMake configs, I've had some
difficulty using them at times, and so found it easier to maintain one myself.
These should all be considered _optional_: if your system supplies configs and
they work for you, prefer those.

## Usage
Ensure whichever configs you need are on your `CMAKE_FIND_ROOT_PATH`, and then
use `find_package`:

```cmake
find_package(SDL2 REQUIRED CONFIGS)
find_package(SDL2_image REQUIRED CONFIGS)
find_package(SDL2_mixer REQUIRED CONFIGS)
find_package(SDL2_ttf REQUIRED CONFIGS)
```

## Notes
### SDL2
Your system will likely have a config file for SDL2; that _may_ be more
reliable, depending on the system and how up-to-date it is.

### SDL2_ttf
The SDL2_ttf config file will automatically find Freetype.

## License
See [LICENSE](./LICENSE).

## Contributing
All contributions and suggestions are very welcome.
