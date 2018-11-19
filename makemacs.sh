#!/bin/sh
 
 cd ~/Desktop
 mkdir emacs_ns
 cd ~/Desktop/emacs_ns
 VERSION=26.1
 #fishの場合、
 #set VERSION 26.1
 #POSTFIX=-rc1
 curl -LO ftp://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.gz
 #curl -LO ftp://alpha.gnu.org/gnu/emacs/pretest/emacs-$VERSION$POSTFIX.tar.xz
 curl -LO https://gist.githubusercontent.com/takaxp/5294b6c52782d0be0b25342be62e4a77/raw/9c9325288ff03a50ee26e4e32c8ca57c0dd81ace/emacs-25.2-inline-googleime.patch
 curl -LO https://gist.githubusercontent.com/takaxp/01ff965361d70de93e9aba3795193cc7/raw/4265d48c13f33a2046669086756c85a2bb83c318/ns-private.patch
 tar zxvf emacs-$VERSION.tar.gz
 cd ./emacs-$VERSION
 patch -p1 < ../emacs-25.2-inline-googleime.patch
 patch -p1 < ../ns-private.patch
 sleep 5
 ./autogen.sh
 ./configure CC=clang --without-x --with-ns --with-modules --with-imagemagick
 make bootstrap -j1
 make install -j1
 cd ./nextstep
 open .
