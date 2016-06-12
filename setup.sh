#!/bin/bash

echo "Instaling Bundler"
gem install bundler
bundle install

echo "Instaling or Updating Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

echo "Instaling or Updating Swiftlint"
which -s swiftlint
if [[ $? != 0 ]] ; then
    brew install swiftlint
else
    brew upgrade swiftlint
fi

echo "Executing CocoaPods"
cd CocoaHeadsApp
pod install
