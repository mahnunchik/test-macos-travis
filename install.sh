
#!/usr/bin/env bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    # Install some custom requirements on OS X
    echo "MacOS!"
    brew update
    brew install openssl qt5 python3 autoconf automake libtool 
    brew link --force openssl
    brew unlink boost
    brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/1fa330ce7a067406ff05392dead86cccdc0794bd/Formula/boost.rb
else
    # Install some custom requirements on Linux
    echo "Linux!"
fi