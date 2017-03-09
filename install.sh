#!bin/sh

echo "$1" | sudo -S -v

#Dock設定
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock largesize -float 100
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock orientation -string "right"
defaults write com.apple.dock mineffect -string "genie"
defaults write com.apple.dock no-glass -boolean YES
defaults write com.apple.dock mouse-over-hilite-stack -bool true
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock no-bouncing -bool true
defaults write com.apple.dock autohide-immutable -bool true

#Mission Control設定
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock workspaces-edge-delay -float 0

#エネルギー設定
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

#キーボード設定
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15;

#Launchpad設定
defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0

#Safari設定
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari ShowStatusBar -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.0

#terminal設定
defaults write com.apple.helpviewer DevMode -bool true

#Finder設定
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowTabView -bool true
chflags nohidden ~/Library
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder AppleShowAllFiles NO
defaults write com.apple.finder GoToField -string /
defaults write com.apple.finder FinderSounds -bool no
defaults write -g AppleShowAllExtensions -bool true

#Quick Look設定
defaults write com.apple.finder QLEnableTextSelection -bool true

#Trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

#その他設定
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE H:mm'

defaults write com.apple.screencapture type -string "png"

defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

defaults write com.apple.screencapture location ~/Pictures

defaults write com.apple.screencapture include-date -bool false

defaults write com.apple.dock no-bouncing -bool true

defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

defaults write -g PMPrintingExpandedStateForPrint -bool true

defaults write -g NSWindowResizeTime 0.1

defaults write com.apple.finder AutoStopWhenSelectionChanges -bool false

defaults write com.apple.finder AutoStopWhenScrollingOffBounds -bool false

defaults write com.apple.finder QLInlinePreviewMinimumSupportedSize -int 0

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

defaults write com.apple.NetworkBrowser ShowThisComputer -bool true

defaults write com.apple.finder CreateDesktop -bool false

defaults write com.apple.LaunchServices LSQuarantine -bool false

defaults write com.apple.screencapture disable-shadow -bool true

defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0

defaults write -g AppleLanguages -array ja

defaults write com.apple.ImageCapture disableHotPlug -bool NO

defaults write com.apple.CrashReporter DialogType none

defaults write com.apple.dashboard devmode YES

defaults write com.apple.dock itunes-notifications -bool TRUE

defaults write com.apple.iTunes high-contrast-mode-enable -bool true

defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

defaults write com.apple.dashboard mcx-disabled -boolean true

defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

killall Dock
killall SystemUIServer
killall Finder

#デザイン設定
sudo cp modIncosolata.ttf $HOME/Library/Fonts/
set_font() {
	osascript -e "tell application \"Terminal\" to set the font name of window 1 to \"$1\""
    osascript -e "tell application \"Terminal\" to set font size of window 1 to $2"
}

set_font "modIncosolata" 14

#APP,package設定
echo "$1" | sudo -S xcodebuild -license

xcode-select --install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install brew-cask

brew_init() {
	echo "Initializing brew"
	brew update
	brew upgrade --all
	brew cleanup
	brew linkapps
}

brew_init

package_install() {
	echo EXCUTING brew install $1 $2
	brew install $1 $2
	[ $? -ne 0 ] && echo ERROR brew install $1 $2
}

app_install() {
	echo EXCUTING brew cask install $1 $2
	brew cask install $1 $2
	[ $? -ne 0 ] && echo ERROR brew cask install $1 $2
}

#パッケージインストール
package_install git ''
package_install wget ''
package_install curl ''
package_install zsh ''
package_install tmux ''
package_install docker-machine ''
package_install docker ''
package_install java ''
package_install carthage ''

#アプリケーションインストール
app_install virtualbox ''
app_install google-chrome ''
app_install ccleaner ''
app_install atom ''
app_install slack ''
app_install appcleaner ''
app_install kindle ''
app_install eclipse-ide ''
app_install Caskroom/cask/vivaldi ''
app_install filezilla ''
app_install android-studio ''

atom_package_install() {
	echo EXCUTING apm install $1
	apm install $1
	[ $? -ne 0 ] && echo ERROR apm install $1
}

#atomパッケージインストール
atom_package_install emmet
atom_package_install autocomplete-paths
atom_package_install color-picker
atom_package_install highlight-selected
atom_package_install atom-material-ui
atom_package_install monokai
atom_package_install pretty-json
atom_package_install linter
atom_package_install regex-railroad-diagram
atom_package_install file-icons

echo "$1" | sudo -S open ./monokai.terminal
echo "$1" | sudo -S chsh -s /usr/local/bin/zsh
echo "$1" | sudo -S reboot
