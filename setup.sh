#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

# -- Log -----------------------------------------------------------------------
function msg { echo  "\033[0;37m$1\033[0m"; }
function msg_ok { echo  "➜\033[1;32m $1 ✔\033[0m"; }
function msg_run { echo  "➜\033[1;35m $1 $ $2\033[0m"; }

# -- Dependencies --------------------------------------------------------------
msg "Instaling Bundler!"
if which ruby &> /dev/null; then
	msg_run "bundler" "sudo gem install bundler"
	sudo gem install bundler
else
	msg_run "bundler" "gem install bundler"
	gem install bundler
fi

msg "Installing Homebrew!"
if which brew &> /dev/null; then
	msg_ok "homebrew"
else
	msg_run "homebrew" "/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)""
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

msg "Installing/Updating Swiftlint"
which -s swiftlint
if [[ $? != 1 ]] ; then
    msg_ok "swiftlint"
else
    msg_run "swiftlint" "brew install swiftlint"
    brew install swiftlint
fi

msg "Installing CocoaPods"
if ! gem spec pod > /dev/null 2>&1; then
    sudo bundle install pod
fi

msg "Executing CocoaPods"
bundle exec pod repo update
bundle exec pod install
