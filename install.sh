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

#共有設定
echo "$1" | sudo scutil --set ComputerName H_Funakoshi
echo "$1" | sudo scutil --set LocalHostName HirotoFunakoshi

#Terminal設定
defaults write com.apple.helpviewer DevMode -bool true
defaults write com.apple.terminal StringEncodings -array 4

load_terminal_thema_setting() {
	echo "$1" | sudo -S open ./monokai.terminal; sleep 2
	defaults write com.apple.Terminal "Startup Window Settings" -string "monokai"
	defaults write com.apple.Terminal "Default Window Settings" -string "monokai"
}

load_terminal_font_setting() {
    echo "$1" | sudo -S cp ./modIncosolata.ttf $HOME/Library/Fonts
	set_font() {
		osascript -e "tell application \"Terminal\" to set the font name of window 1 to \"$1\""
		osascript -e "tell application \"Terminal\" to set font size of window 1 to $2"
	}
	set_font "modIncosolata.ttf" 14
}

load_terminal_thema_setting
load_terminal_font_setting

defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"

killall Dock
killall SystemUIServer
killall Finder


#echo "$1" | sudo -S xcodebuild -license
xcode-select --install

#Homebrewインストール
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/bundle

brew_init() {
	echo "Initializing brew"
	brew update
	brew upgrade --all
	brew cleanup
	brew linkapps
}

gem_init() {
	echo "Initializing gem"
	gem update --system
}

brew_init
gem_init

brew install caskroom/cask/brew-cask

brew_package_install() {
	echo EXCUTING brew install $1 $2
	brew install $1 $2
	[ $? -ne 0 ] && echo ERROR brew install $1 $2
}

gem_package_install() {
	echo EXCUTING gem install $1 $2
	echo "$1" | sudo -S gem install $1 $2
	[ $? -ne 0 ] && echo ERROR gem install $1 $2
}

app_install() {
	echo EXCUTING brew cask install $1 $2
	brew cask install $1 $2
	[ $? -ne 0 ] && echo ERROR brew cask install $1 $2
}

#brewパッケージインストール
brew_package_install openssl ''
brew_package_install git ''
brew_package_install wget ''
brew_package_install curl ''
brew_package_install zsh ''
brew_package_install tmux ''
brew_package_install docker-machine ''
brew_package_install docker ''
brew_package_install carthage ''
brew_package_install fontconfig ''
brew_package_install go ''
#↓nvimインストール用
brew_package_install cmake ''
brew_package_install pkg-config ''
brew_package_install libtool ''
#↓nvim plugins(deoplete-swift)用
brew_package_install sourcekitten ''
#↓nvim Plugins(syntastic-swiftlint.vim)用
brew_package_install swiftlint ''

#gemパッケージインストール
echo "$1" | sudo -S gem install -n /usr/local/bin cocoapods
echo "$1" | sudo -S gem install synx

#アプリケーションインストール
app_install virtualbox ''
app_install vagrant ''
app_install google-chrome ''
app_install ccleaner ''
app_install atom ''
app_install slack ''
app_install appcleaner ''
app_install kindle ''
app_install java ''
app_install netbeans ''
app_install android-studio ''
app_install filezilla ''
app_install google-japanese-ime ''

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


#nvimインストール
nvim_install() {
	echo "$1" | sudo -S rm -rf $HOME/neovim
	echo "$1" | sudo -S rm -rf /usr/local/bin/nvim
	echo "$1" | sudo rm -rf /usr/local/share/nvim
	cd $HOME
	git clone https://github.com/neovim/neovim
	cd neovim
	make clean
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
	cd ../
	rm -rf neovim
}

nvim_install $1


#anyenv設定読み込み
load_anyenv_settings() {
    if [ -d $HOME/.anyenv ]; then
		export PATH="$HOME/.anyenv/bin:$PATH"
		echo $PATH
		eval "$(anyenv init -)"
		for D in 'ls $HOME/.anyenv/envs'
		do
			export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
		done
	fi
}


#anyenvインストール
rm -r $HOME/.anyenv
git clone https://github.com/riywo/anyenv $HOME/.anyenv
rm -r $HOME/.anyenv/plugins
mkdir $HOME/.anyenv/plugins
git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update
git clone git://github.com/aereal/anyenv-exec.git $HOME/.anyenv/plugins/anyenv-exe
git clone https://github.com/znz/anyenv-git.git $HOME/.anyenv/plugins/anyenv-git

load_anyenv_settings
anyenv install -l


#Python設定
anyenv install pyenv
mkdir -p $HOME/.anyenv/envs/pyenv/plugins

load_anyenv_settings

pyenv install 2.7.13
pyenv install 3.6.0
pyenv global 2.7.13 3.6.0

load_anyenv_settings

pip install --upgrade pip
pip2 install --upgrade pip2
pip3 install --upgrade pip3

pip install --upgrade neovim
pip2 install --upgrade neovim
pip3 install --upgrade neovim

#Swift設定
pip3 install pyyaml #autocomplete-swift用
pip2 install pyyaml #autocomplete-swift用

#PHP設定



#Java設定



#vagrantの初期設定
vagrant_setup() {
	vagrant box add CentOS7 https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box
	mkdir -p $HOME/vagrant/CentOS7
	cd $HOME/vagrant/CentOS7
	vagrant init CentOS7
}

vagrant_setup


echo "$1" | sudo -S chsh -s /usr/local/bin/zsh $USER
echo "$1" | sudo -S reboot
