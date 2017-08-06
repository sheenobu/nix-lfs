{ stdenv, ... }:

# This is our binutils package for our initial bootstrapping.
# TODO: there are some LinuxFromScatch specific configure
# arguments that we have removed (for now)
stdenv.package {
  name = "tools-binutils-2.27";
  src = stdenv.fetchurl {
    url = "http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.bz2";
    hashMD5 = "2869c9bf3e60ee97c74ac2a6bf4e9d68";
  };
  buildScript = "
    mkdir -p $out/src
    cd $out/src
    tar xfj $src
    mkdir -p $out/build
    cd $out/build
    $out/src/binutils-2.27/configure --prefix=$out --with-lib-path=$out/lib --disable-nls --disable-werror
    make
    make install

    # cleanup
    rm -rf $out/build
    rm -rf $out/src
  ";
}
