# nix-lfs

A workthrough of LinuxFromScratch stable using nix. 

This project is mostly educational.

## details

No `nixpkgs`, so there is no `stdenv`. functions like
`fetchurl` must be defined.

*Might* follows LHS. All the packages would be built, then converged
to build an LHS-compatible system.

Only using `x86_64-linux` as the system right now.
