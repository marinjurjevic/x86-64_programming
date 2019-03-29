# x86-64 Assembly Language Examples

This repository contains examples from the book [x86-64 Assembly Language Programming with Ubuntu](http://www.egr.unlv.edu/~ed/x86.html) (v.1.1.14) by Ed Jorgensen provided under [CC-BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode). Code will be updated as I progress through examples and projects in the book. 

## Prerequisites

All examples are written and tested under Ubuntu 18.04 64-bit. Author also recommends Ubuntu distribution, although code should work on any Linux-based 64-bit OS.

## Tools
For assembling you will need [yasm](https://yasm.tortall.net/).

```
sudo apt-get update
sudo apt-get install yasm
```

For debugging [gdb](https://www.gnu.org/software/gdb/) is used. 
```
$ sudo apt-get install gdb
```
 
## Build

Sources are organized under `./src` folder and follow chapters from the book. All sources can be built by running `make` from root project directory. Also, every chapter can be individually built. Executables are stored under the same relative path in `./bin` folder.

```
./src $ make                # builds all chapters
./src/chapter_7 $ make      # builds only chapter 7
./src $ make clean          # cleans ./bin dir
```

## Usage

For testing, debugging and checking if code is doing what is suppoed to do gdb (GNU Project Debugger) is used. Another options is to use [ddd](https://www.gnu.org/software/ddd/) (Data Display Debugger) if you are uncomfortable with terminal. For each assembly file, I've prepared a `_dbg.in` file which is gdb Command File. Command files are just list of gdb commands which are then executed sequentially in interactive or non-interactive mode. Example of usage (if you are positioned in root dir):

```
$ gdb -x dbg/chapter_7/unsigned_byte_operations.in bin/chapter_7/unsigned_byte_operations
```


### TODO
- [x] Chapter 7
- [ ] Chapter 8
- [ ] Chapter 9
- ...