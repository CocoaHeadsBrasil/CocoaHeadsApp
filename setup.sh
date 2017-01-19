#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

declare -a GEMS=("cocoapods" "cocoapods-acknowledgements" "bundler")
declare -a BREW_FORMULAES=("swiftlint")

echo "Installing dependencies!"

if which brew &> /dev/null; then
	echo "Homebrew ✔"
else
	echo "Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

for formulae in "${BREW_FORMULAES[@]}"
do
	if brew list | grep -c $formulae &> /dev/null; then
		echo "$formulae ✔"
	else
		echo "Installing $formulae"
		brew install $formulae
	fi
done

for gem in "${GEMS[@]}"
do
	if gem list -i $gem &> /dev/null; then
		echo "$gem ✔"
	else
		echo "Installing $gem"
		sudo gem install $gem
	fi
done

echo "Installing Cocoapods dependencies!"
pod repo update
pod install
