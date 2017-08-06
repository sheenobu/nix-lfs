{ stdenv }: { name, src, buildScript }:
let

  # right now we take a shortcut and define PATH
  # as something standard so build scripts can
  # directly invoke mkdir, tar.
  bs = builtins.toFile "builder.sh" "
    export PATH=\"/bin:/usr/bin:/usr/local/bin\"
    ${buildScript}
  ";

  # the src parameter is always a function which
  # we must invoke with our package name.
  #
  # tools like 'fetchurl' are returning a function
  # which require a name parameter.
  s = src { name = name; };

in derivation {
  inherit name;
  src = s;
  system = stdenv.system;
  builder = stdenv.tools.bash;
  args = [ "-e" bs ];
}
