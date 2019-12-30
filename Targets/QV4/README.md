# Target: QV4

To build QV4 (libQt5Qml) for fuzzing:

1. Clone Qt and check out your target tag: `git clone -b v5.13.1 https://code.qt.io/qt/qt5.git`
2. Fetch all dependent libraries: `perl init-repository --module-subset=default,-qtwebengine`
3. Apply qt.patch. The patch should apply cleanly to v5.13.1.
4. Run the fuzzbuild.sh script in the Qt source directory
5. `./build/qtbase/bin/qmljs` will be the JavaScript shell for the fuzzer.
