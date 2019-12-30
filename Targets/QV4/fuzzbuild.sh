#!/bin/bash
#
# Copyright 2019 Tobias Holl
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export SRCDIR="$(pwd)"
export DISABLE_EVERYTHING="-nomake examples -nomake tests -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcanvas3d -skip qtcharts -skip qtdatavis3d -skip qtconnectivity -skip qtdoc -skip qtdocgallery -skip qtfeedback -skip qtgamepad -skip qtlocation -skip qtlottie -skip qtmacextras -skip qtmultimedia -skip qtnetworkauth -skip qtpim -skip qtpurchasing -skip qtqa -skip qtremoteobjects -skip qtscript -skip qtscxml -skip qtsensors -skip qtserialbus -skip qtserialport -skip qttranslations -skip qtvirtualkeyboard -skip qtwayland -skip qtwebchannel -skip qtwebengine -skip qtwebglplugin -skip qtwebsockets -skip qtwebview -skip qtwinextras -skip qtxmlpatterns -no-widgets -no-dbus"

# According to Qt, we must build this on the same depth as the Qt source tree :/
# This is not ideal (and in my experience not necessary), but I am not going to risk it
# If the fuzzbuild_OPT.OBJ folder annoys you, feel free to move or rename it after the build...
mkdir -p ../fuzzbuild_OPT.OBJ
cd ../fuzzbuild_OPT.OBJ

# You need to accept the license yourself (if you want to automate this, specify -confirm-license here)
# Build with static linkage so that we can ONLY keep the JS console + engine
"$SRCDIR/configure" -platform linux-clang -coverage trace-pc-guard -developer-build -opensource $DISABLE_EVERYTHING -no-strip -static  

make # Set MAKEFLAGS to configure this
