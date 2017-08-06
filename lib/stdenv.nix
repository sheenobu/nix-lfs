let
  # anything defined in let is private to this file.

  # bootstrap is our subset of stdenv used to
  # setup our various functions like `fetchurl`
  # and `package`.
  _bootstrap = import ./bootstrap.nix;
in {
  # make bootstrap objects stdenv objects.
  tools = _bootstrap.tools;
  system = _bootstrap.system;

  # import fetchurl function into stdenv
  fetchurl = import ./fetchurl.nix { stdenv = _bootstrap; };

  # import package function into stdenv;
  package = import ./package.nix { stdenv = _bootstrap; };

}
