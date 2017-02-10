#!/bin/bash
set -x
set -e

cd ~
git clone https://github.com/m-lab/builder
cd builder
DISABLE_APPLET_SIGNING=1 ./build.sh iupui_ndt

LD_LIBRARY_PATH=/home/iupui_ndt/build/lib NDT_HOSTNAME=localhost \
~/builder/iupui_ndt/ndt-3.7.0.1/src/web100_testoptions_unit_tests

LD_LIBRARY_PATH=/home/iupui_ndt/build/lib NDT_HOSTNAME=localhost \
~/builder/iupui_ndt/ndt-3.7.0.1/src/web100_websocket_unit_tests

# This test doesn't currently work on travis because it requires
# web100 patched kernel.
# LD_LIBRARY_PATH=/home/iupui_ndt/build/lib NDT_HOSTNAME=localhost \
# ~/builder/iupui_ndt/ndt-3.7.0.1/src/web100srv_unit_tests
