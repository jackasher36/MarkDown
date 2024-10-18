# Macbook控制台指令

## 恢复默认设置

```sh
defaults write com.apple.dock springboard-rows Default

defaults write com.apple.dock springboard-columns Default

defaults write com.apple.dock ResetLaunchPad -bool TRUE

killall Dock

```

设置数量

```sh
defaults write com.apple.dock springboard-columns -int 9

defaults write com.apple.dock springboard-rows -int 6

defaults write com.apple.dock ResetLaunchPad -bool TRUE

killall Dock

```

