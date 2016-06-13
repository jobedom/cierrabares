cierrabares
===========

Small utility to close a certain application when a left click 
(or a tap) is held in the upper right corner of the screen.

`cierrabares.exe` and `cierrabares.ini` should be in the same folder,
tipically along with the target application.

INI file format is as follows.

```
[Default]
buttonSize = 200
pressTime = 1000
targetExecutable = calc.exe
```

`buttonSize` is the side length in pixels of the square to be clicked
in the upper right corner.

`pressTime` is the needed time for the click to be held, in milliseconds.

`targetExecutable` is, well, the target executable name. 
No path should be specified, just the file name with `.exe` extension.

Enjoy.

