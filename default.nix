rec {
  # rec allows tools to reference stdenv. rec means 'recursive'.

  # call our standard environment
  stdenv = import ./lib/stdenv.nix;

  # call our tools group with our defined standard environment.
  tools = import ./tools {
    inherit stdenv;
  };
}
