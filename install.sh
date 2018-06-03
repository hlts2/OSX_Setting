#!bin/sh

echo "$1" | sudo -S -v

#Dock設定
echo "$1" | sudo -S defaults write com.apple.dock tilesize -int 40
echo "$1" | sudo -S defaults write com.apple.dock largesize -float 100
echo "$1" | sudo -S defaults write com.apple.dock magnification -bool true
echo "$1" | sudo -S defaults write com.apple.dock orientation -string "right"
echo "$1" | sudo -S defaults write com.apple.dock mineffect -string "genie"
echo "$1" | sudo -S defaults write com.apple.dock no-glass -boolean YES
echo "$1" | sudo -S defaults write com.apple.dock mouse-over-hilite-stack -bool true
echo "$1" | sudo -S defaults write com.apple.dock showhidden -bool true
echo "$1" | sudo -S defaults write com.apple.dock no-bouncing -bool true
echo "$1" | sudo -S defaults write com.apple.dock autohide-immutable -bool true

#Mission Control設定
echo "$1" | sudo -S defaults write com.apple.dock expose-animation-duration -float 0.1
echo "$1" | sudo -S defaults write com.apple.dock workspaces-edge-delay -float 0

#エネルギー設定
echo "$1" | sudo -S defaults write com.apple.menuextra.battery ShowPercent -string "YES"
echo "$1" | sudo -S defaults write com.apple.menuextra.battery ShowTime -string "YES"

#キーボード設定
echo "$1" | sudo -S defaults write -g KeyRepeat -int 2
echo "$1" | sudo -S defaults write -g InitialKeyRepeat -int 15;

#Launchpad設定
echo "$1" | sudo -S defaults write com.apple.dock springboard-show-duration -int 0
echo "$1" | sudo -S defaults write com.apple.dock springboard-hide-duration -int 0

#Safari設定
echo "$1" | sudo -S defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
echo "$1" | sudo -S defaults write com.apple.Safari IncludeDevelopMenu -bool true
echo "$1" | sudo -S defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
echo "$1" | sudo -S defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
echo "$1" | sudo -S defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
echo "$1" | sudo -S defaults write com.apple.Safari ShowStatusBar -bool true
echo "$1" | sudo -S defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
echo "$1" | sudo -S defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
echo "$1" | sudo -S defaults write com.apple.Safari AutoFillPasswords -bool false
echo "$1" | sudo -S defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.0

#Finder設定
echo "$1" | sudo -S defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
echo "$1" | sudo -S defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
echo "$1" | sudo -S defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
echo "$1" | sudo -S defaults write com.apple.finder NewWindowTarget -string "PfDe"
echo "$1" | sudo -S defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
echo "$1" | sudo -S defaults write com.apple.finder ShowPathbar -bool true
echo "$1" | sudo -S defaults write com.apple.finder ShowStatusBar -bool true
echo "$1" | sudo -S defaults write com.apple.finder ShowTabView -bool true
echo "$1" | sudo -S chflags nohidden ~/Library
echo "$1" | sudo -S defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
echo "$1" | sudo -S defaults write com.apple.finder AppleShowAllFiles NO
echo "$1" | sudo -S defaults write com.apple.finder GoToField -string /
echo "$1" | sudo -S defaults write com.apple.finder FinderSounds -bool no
echo "$1" | sudo -S defaults write -g AppleShowAllExtensions -bool true

#Quick Look設定
echo "$1" | sudo -S defaults write com.apple.finder QLEnableTextSelection -bool true

#Trackpad
echo "$1" | sudo -S defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
echo "$1" | sudo -S defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
echo "$1" | sudo -S defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

#その他設定
echo "$1" | sudo -S defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "$1" | sudo -S defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE H:mm'

echo "$1" | sudo -S defaults write com.apple.screencapture type -string "png"

echo "$1" | sudo -S defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "$1" | sudo -S defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "$1" | sudo -S defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo "$1" | sudo -S defaults write com.apple.screencapture location ~/Pictures

echo "$1" | sudo -S defaults write com.apple.screencapture include-date -bool false

echo "$1" | sudo -S defaults write com.apple.dock no-bouncing -bool true

echo "$1" | sudo -S defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

echo "$1" | sudo -S defaults write -g PMPrintingExpandedStateForPrint -bool true

echo "$1" | sudo -S defaults write -g NSWindowResizeTime 0.1

echo "$1" | sudo -S defaults write com.apple.finder AutoStopWhenSelectionChanges -bool false

echo "$1" | sudo -S defaults write com.apple.finder AutoStopWhenScrollingOffBounds -bool false

echo "$1" | sudo -S defaults write com.apple.finder QLInlinePreviewMinimumSupportedSize -int 0

echo "$1" | sudo -S defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
echo "$1" | sudo -S defaults write com.apple.desktopservices DSDontWriteNetworkStores true

echo "$1" | sudo -S defaults write com.apple.NetworkBrowser ShowThisComputer -bool true

echo "$1" | sudo -S defaults write com.apple.finder CreateDesktop -bool false

echo "$1" | sudo -S defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "$1" | sudo -S defaults write com.apple.screencapture disable-shadow -bool true

echo "$1" | sudo -S defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0

echo "$1" | sudo -S defaults write -g AppleLanguages -array ja

echo "$1" | sudo -S defaults write com.apple.ImageCapture disableHotPlug -bool NO

echo "$1" | sudo -S defaults write com.apple.CrashReporter DialogType none

echo "$1" | sudo -S defaults write com.apple.dashboard devmode YES

echo "$1" | sudo -S defaults write com.apple.dock itunes-notifications -bool TRUE

echo "$1" | sudo -S defaults write com.apple.iTunes high-contrast-mode-enable -bool true

echo "$1" | sudo -S defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

echo "$1" | sudo -S defaults write com.apple.dashboard mcx-disabled -boolean true

echo "$1" | sudo -S defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#共有設定
echo "$1" | sudo scutil --set ComputerName H_Funakoshi
echo "$1" | sudo scutil --set LocalHostName HirotoFunakoshi

#Terminal設定
echo "$1" | sudo -S defaults write com.apple.helpviewer DevMode -bool true
echo "$1" | sudo -S defaults write com.apple.terminal StringEncodings -array 4

load_terminal_thema_setting() {
    echo "$1" | sudo -S open ./monokai.terminal; sleep 2
    echo "$1" | sudo -S killall Dockdefaults write com.apple.Terminal "Startup Window Settings" -string "monokai"
    echo "$1" | sudo -S killall Dockdefaults write com.apple.Terminal "Default Window Settings" -string "monokai"
}

load_terminal_font_setting() {
    wget "https://github.com/edihbrandon/RictyDiminished/raw/master/$2"

    echo "$1" | sudo -S cp ./$2 $HOME/Library/Fonts

    echo "$1" | sudo -S osascript -e "tell application \"Terminal\" to set the font name of window 1 to \"$2\""
    echo "$1" | sudo -S osascript -e "tell application \"Terminal\" to set font size of window 1 to 11"
}

load_terminal_thema_setting $1
load_terminal_font_setting $1 RictyDiminished-Regular.ttf

echo "$1" | sudo -S defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"

echo "$1" | sudo -S killall Dock
echo "$1" | sudo -S killall Dockkillall SystemUIServer
echo "$1" | sudo -S killall Dockkillall Finder


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

#brewパッケージインストール
brew bundle

#gemパッケージインストール
echo "$1" | sudo -S gem install -n /usr/local/bin cocoapods
echo "$1" | sudo -S gem install synx

#atomパッケージインストール
apm install --packages-file atom.package

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

#anyenvインストール
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

load_anyenv_settings

anyenv install -l

#pyenvインストール
pyenv_settings() {
    anyenv install pyenv
    mkdir -p $HOME/.anyenv/envs/pyenv/plugins

    pyenv install 2.7.13
    pyenv install 3.6.0
    pyenv global 2.7.13 3.6.0
}

pyenv_settings
load_anyenv_settings

pip install --upgrade pip
pip2 install --upgrade pip2
pip3 install --upgrade pip3

#neovim設定
pip install --upgrade neovim
pip2 install --upgrade neovim
pip3 install --upgrade neovim

#Go設定
go get -u github.com/nsf/gocode
go get code.google.com/p/go.tools/cmd/godoc
go get github.com/golang/lint

pip2 install ujson
pip3 install ujson

#Python設定
pip3 install jedi

#Xcode設定(XVim)
cd ~/Library/Application\ Support/Developer/Shared/Xcode/
mkdir Plug-ins
cd Plug-ins
git clone https://github.com/keith/XVim.git
git fetch origin xcode-8.3-release
git checkout xcode-8.3-release
make

#Swift設定
pip3 install pyyaml #autocomplete-swift用
pip2 install pyyaml #autocomplete-swift用

#vagrantの初期設定
vagrant_centos_setup() {
    vagrant box add CentOS7 https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box
    mkdir -p $HOME/vagrant/CentOS7
    cd $HOME/vagrant/CentOS7
    vagrant init CentOS7
}

vagrant_coreos_setup() {
    cd $HOME/vagrant
    git clone https://github.com/coreos/coreos-vagrant.git
    mv coreos-vagrant CoreOS
}

vagrant_coreos_setup
vagrant_centos_setup

echo "$1" | sudo -S chsh -s /usr/local/bin/zsh $USER
echo "$1" | sudo -S reboot
