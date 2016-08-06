
#!/usr/bin/env bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    # Install some custom requirements on OS X
    echo "MacOS!"
    brew update
    brew upgrade cmake git autoconf automake libtool openssl
    brew install qt5 python3
    # Downgrade boost to 1.58.0
    brew unlink boost
    brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/1fa330ce7a067406ff05392dead86cccdc0794bd/Formula/boost.rb
else
    # Install some custom requirements on Linux
    echo "Linux!"
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends \
      ca-certificates \
      build-essential \
      cmake \
      git \
      doxygen \
      libboost-all-dev \
      libssl-dev \
      autogen \
      automake \
      libtool \
      python3
      autotools-dev \
      libbz2-dev \
      libicu-dev

    export BOOST_ROOT=$HOME/opt/boost_1_60_0
    wget -c 'http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.bz2/download' \
        -O boost_1_60_0.tar.bz2
    tar xjf boost_1_60_0.tar.bz2
    cd boost_1_60_0/
    ./bootstrap.sh "--prefix=$BOOST_ROOT"
    ./b2 install
fi
