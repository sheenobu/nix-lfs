{ stdenv }:
let
  # callpackage lets us call a package that requires stdenv
  # without needing to 'inherit stdenv' for every one. It's a
  # utility/shortcut function
  callPackage = { file }: import file { inherit stdenv; };
in
{
  # binutils is our first 'tool', according to the linux from scratch docs
  binutils = callPackage {
    file = ./binutils.nix;
  };

  # TODO: there is a way to get callpackage to work like:
  # callPackage ./filename.nix BUT i'm not sure how to do it.
}
