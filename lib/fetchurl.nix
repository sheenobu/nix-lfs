# this is a function whiation ch returns a function which returns a function...

# defining the 'fetchurl' function means injecting stdenv.

# defining a specific fetchurl invocation requires
# the URL and hashMD5.

# defining the final derivation (location in the nix estore)
# requires a package name that is invoked internally in stdenv.package

# this final derivation becomes the $src variable within a stdenv.package
# build script.

{ stdenv }: { url, hashMD5 }: { name }:
    let buildScript = builtins.toFile "downloader.sh" "
      ${stdenv.tools.wget} ${url} -O $out
      echo \"${hashMD5} $out\" | ${stdenv.tools.md5sum} -c
    ";
   in derivation {
     name = "${name}-src";
     system = stdenv.system;
     builder = stdenv.tools.bash;
     args = [ "-e" buildScript ];
   }

# we use md5sum here because linux-from-scratch defines
# everything with md5sum.
