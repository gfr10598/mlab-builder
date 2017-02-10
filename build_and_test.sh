#!/bin/bash
./build_ndt.sh
set -x
set -e
LD_LIBRARY_PATH=/home/iupui_ndt/build/lib NDT_HOSTNAME=localhost \
build/iupui_ndt/ndt-3.7.1/src/web100_testoptions_unit_tests
LD_LIBRARY_PATH=/home/iupui_ndt/build/lib NDT_HOSTNAME=localhost \
build/iupui_ndt/ndt-3.7.1/src/web100_websocket_unit_tests
