#!/usr/bin/env bash

# タップでクリック
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# スクロール方向をナチュラルに
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# バッテリー残量を％表記に
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 日付と時刻のフォーマット（24時間表示、秒表示あり、日付・曜日を表示）
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"
# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# スクショの保存先を変更
defaults write com.apple.screencapture location "~/Pictures/"
defaults write com.apple.screencapture name -string "Screen Shot"

killall SystemUIServer
