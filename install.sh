
#!/usr/bin/env bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    # Install some custom requirements on OS X
    echo "MacOS!"
    brew update
    brew upgrade cmake git autoconf automake libtool openssl
    brew install qt5 python3
    brew link --force openssl
    brew unlink boost
    # Downgrade boost to 1.58.0
    brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/1fa330ce7a067406ff05392dead86cccdc0794bd/Formula/boost.rb
else
    # Install some custom requirements on Linux
    echo "Linux!"
fi