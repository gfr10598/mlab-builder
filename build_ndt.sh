#!/bin/bash
cd ~
git clone https://github.com/m-lab/builder
cd builder
DISABLE_APPLET_SIGNING=1 ./build.sh iupui_ndt
