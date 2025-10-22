#
# Simple Makefile for a Prog8 program.
#

# Cross-platform removal command
ifeq ($(OS),Windows_NT)
    CLEAN = del /Q build\* 
    CP = copy
    RM = del /Q
    MD = mkdir
else
    CLEAN = rm -f build/*
    CP = cp -p
    RM = rm -f
    MD = mkdir -p
endif

PCC=prog8c
PCCARGS=-asmlist -target c64 -out build/
PCCARGSX16=-asmlist -target cx16 -out build/

PROGSC64 = build/main-c64.prg
PROGSX16 = build/main-x16.prg
PROGS = $(PROGSC64) $(PROGSX16)

all: builddir $(PROGS)

builddir:
	$(MD) build

build/main-c64.prg : src/main-c64.p8
	$(PCC) $(PCCARGS) $< 

build/main-x16.prg : src/main-x16.p8
	$(PCC) $(PCCARGSX16) $< 

clean:
	$(CLEAN)

run: all
	x64sc -model ntsc -keymap 1 -autostartprgmode 1 build/main-c64.prg

runbasic: 
	x64sc -model ntsc -keymap 1 -autostartprgmode 1 numberguess.prg

runc64: builddir clean
	$(PCC) $(PCCARGS) -emu src/main-c64.p8

runx16: builddir clean
	$(PCC) $(PCCARGSX16) -emu src/main-x16.p8

#
# end-of-file
#
