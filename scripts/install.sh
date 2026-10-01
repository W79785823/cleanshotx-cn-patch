#!/bin/zsh
set -euo pipefail

APP_PATH="${1:-/Applications/CleanShot X.app}"
BUNDLE_ID="pl.maketheweb.cleanshotx"
SCRIPT_DIR="${0:A:h}"
PROJECT_DIR="${SCRIPT_DIR:h}"
SRC="$PROJECT_DIR/src/CleanShotCN.m"
BUILD_DIR="$PROJECT_DIR/build"
DYLIB_NAME="libCleanShotCN.dylib"
PREF_PLIST="$HOME/Library/Preferences/$BUNDLE_ID.plist"
RESET_TCC="${RESET_TCC:-0}"
BACKUP="${BACKUP:-1}"

if [[ ! -d "$APP_PATH" ]]; then
  echo "找不到 CleanShot X：$APP_PATH"
  echo "用法: ./scripts/install.sh [CleanShot X.app 路径]"
  exit 1
fi

if [[ ! -f "$SRC" ]]; then
  echo "找不到源码文件：$SRC"
  exit 1
fi

if ! command -v clang >/dev/null 2>&1; then
  echo "找不到 clang。请先安装 Xcode Command Line Tools：xcode-select --install"
  exit 1
fi

INFO_PLIST="$APP_PATH/Contents/Info.plist"
MACOS_DIR="$APP_PATH/Contents/MacOS"
TARGET_DYLIB="$MACOS_DIR/$DYLIB_NAME"
STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$PROJECT_DIR/backups/$STAMP"

mkdir -p "$BUILD_DIR"
if [[ "$BACKUP" == "1" ]]; then
  mkdir -p "$BACKUP_DIR"
fi

if [[ "$BACKUP" == "1" && -f "$PREF_PLIST" ]]; then
  echo "正在备份 CleanShot 设置..."
  cp -p "$PREF_PLIST" "$BACKUP_DIR/$BUNDLE_ID.pre-install.plist"
fi

echo "正在退出 CleanShot X..."
osascript -e 'tell application "CleanShot X" to quit' >/dev/null 2>&1 || true
pkill -x "CleanShot X" >/dev/null 2>&1 || true
sleep 1

if [[ "$BACKUP" == "1" ]]; then
  echo "正在备份 Info.plist..."
  cp -p "$INFO_PLIST" "$BACKUP_DIR/Info.plist"
  if [[ -f "$TARGET_DYLIB" ]]; then
    cp -p "$TARGET_DYLIB" "$BACKUP_DIR/$DYLIB_NAME"
  fi
  if [[ -f "$PREF_PLIST" ]]; then
    cp -p "$PREF_PLIST" "$BACKUP_DIR/$BUNDLE_ID.post-quit.plist"
  fi
fi

echo "正在编译汉化动态库和 SwiftUI 语言文件..."
zsh "$SCRIPT_DIR/build.sh"

echo "正在安装动态库..."
cp -p "$BUILD_DIR/$DYLIB_NAME" "$TARGET_DYLIB"
mkdir -p "$APP_PATH/Contents/Resources/zh-Hans.lproj"
cp -p "$PROJECT_DIR/resources/zh-Hans.lproj/Localizable.strings" \
  "$APP_PATH/Contents/Resources/zh-Hans.lproj/Localizable.strings"

echo "正在写入启动注入配置..."
/usr/libexec/PlistBuddy -c 'Delete :LSEnvironment' "$INFO_PLIST" >/dev/null 2>&1 || true
/usr/libexec/PlistBuddy -c 'Add :LSEnvironment dict' "$INFO_PLIST"
/usr/libexec/PlistBuddy -c "Add :LSEnvironment:DYLD_INSERT_LIBRARIES string $TARGET_DYLIB" "$INFO_PLIST"

echo "正在重新签名..."
codesign --force --deep --sign - "$APP_PATH"
codesign --verify --deep --strict --verbose=1 "$APP_PATH"

if [[ -f "$PREF_PLIST" ]]; then
  echo "正在修复设置文件属性..."
  xattr -d com.apple.quarantine "$PREF_PLIST" >/dev/null 2>&1 || true
  chmod 600 "$PREF_PLIST" >/dev/null 2>&1 || true
  chown "$(id -un)":staff "$PREF_PLIST" >/dev/null 2>&1 || true
  killall cfprefsd >/dev/null 2>&1 || true
fi

if [[ "$RESET_TCC" == "1" ]]; then
  echo "正在重置旧权限记录，稍后请在系统设置里重新允许 CleanShot X..."
  tccutil reset ScreenCapture "$BUNDLE_ID" >/dev/null 2>&1 || true
  tccutil reset Accessibility "$BUNDLE_ID" >/dev/null 2>&1 || true
  tccutil reset ListenEvent "$BUNDLE_ID" >/dev/null 2>&1 || true
else
  echo "已保留现有系统权限记录。若权限异常，可用 RESET_TCC=1 ./scripts/install.sh 手动重置。"
fi

echo "正在启动 CleanShot X..."
open -a "CleanShot X"

echo
echo "安装完成。"
echo "如果系统提示权限，请重新允许 CleanShot X 的屏幕录制/辅助功能权限。"
if [[ "$BACKUP" == "1" ]]; then
  echo "备份位置：$BACKUP_DIR"
else
  echo "按要求未创建备份。"
fi
