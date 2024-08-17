#!/bin/zsh

if [ $(uname) != "Darwin" ] ; then
	echo "Not MacOS!"
	exit 0
fi

# ==========
# Dock
# ==========
# dockを隠す
defaults write com.apple.dock autohide -bool true
# dark color
defaults write NSGlobalDomain AppleInterfaceStyle Dark
# dockのコンテンツを削除
defaults write com.apple.dock persistent-apps -array

killall Dock

# ==========
# Finder
# ==========
## 拡張子まで表示
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
## 隠しファイルを表示
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true"
## ゴミ箱を空にするときの警告無効化
defaults write com.apple.finder WarnOnEmptyTrash -bool "false"
# .DS_Store file を生成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores True

killall Finder

# ==========
# Keyboard
# ==========
# キー連続入力によるアクセント入力を無効化
defaults write -g ApplePressAndHoldEnabled -bool false
# キー連続入力の速度
defaults write NSGlobalDomain KeyRepeat -int 2
# キー入力速度
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# ==========
# Mouse
# ==========
## 軌跡の速さ
defaults write -g com.apple.mouse.scaling 2
## スクロールの速さ
defaults write -g com.apple.scrollwheel.scaling 5

# Battery
## バッテリーを%表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# ==========
# Schreenshot
# ==========
## 画像の影を無効化
defaults write com.apple.screencapture "disable-shadow" -bool "true"
## 保存場所
if [[ ! -d "$HOME/Pictures/Screenshots" ]]; then
    mkdir -p "$HOME/Pictures/Screenshots"
fi
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots"
## 撮影時のサムネイル表示
defaults write com.apple.screencapture "show-thumbnail" -bool "false"
## 保存形式
defaults write com.apple.screencapture "type" -string "jpg"

# ==========
# Others
# ==========
# 自動で頭文字を大文字にしない
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool "false"
# スクロールバーを常に表示
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"


###########################################
echo "Done.  Restart computer to see all changes"
