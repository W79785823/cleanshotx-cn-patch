#!/bin/zsh
set -euo pipefail

PROJECT_DIR="${0:A:h:h}"
BUILD_DIR="$PROJECT_DIR/build"
RESOURCE_DIR="$PROJECT_DIR/resources/zh-Hans.lproj"
ARCH="$(uname -m)"

mkdir -p "$BUILD_DIR" "$RESOURCE_DIR"
clang -fobjc-arc -fblocks -arch "$ARCH" -mmacosx-version-min=13.0 \
  -c "$PROJECT_DIR/src/CleanShotCN.m" -o "$BUILD_DIR/CleanShotCN.o"
clang -fobjc-arc -arch "$ARCH" -mmacosx-version-min=13.0 \
  -c "$PROJECT_DIR/src/SwiftUIInterpose.m" -o "$BUILD_DIR/SwiftUIInterpose.o"
swiftc -emit-library -O -target "$ARCH-apple-macosx13.0" \
  -framework AppKit -framework Foundation -framework SwiftUI \
  "$PROJECT_DIR/src/SwiftUIText.swift" "$BUILD_DIR/CleanShotCN.o" "$BUILD_DIR/SwiftUIInterpose.o" \
  -o "$BUILD_DIR/libCleanShotCN.dylib"
clang -fobjc-arc -fblocks -framework AppKit -framework Foundation \
  "$PROJECT_DIR/tools/export-strings.m" -o "$BUILD_DIR/export-strings"
"$BUILD_DIR/export-strings" "$RESOURCE_DIR/Localizable.strings"
plutil -lint "$RESOURCE_DIR/Localizable.strings"
