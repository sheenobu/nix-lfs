# nix-lfs

A workthrough of LinuxFromScratch stable using nix.

This project is mostly educational.

## details

No `nixpkgs`, so there is no `stdenv`. functions like
`fetchurl` must be defined. Any time you see `stdenv`, it
is one defined within this project.

*Might* follows LHS. All the packages would be built, then converged
to build an LHS-compatible system.

Only using `x86_64-linux` as the system right now.

## What works?

### tools

LFS has a section for building 'tools' for bootstrapping
your system. These are, if i understand, discarded once
your system is bootstrapped.

### binutils-tools.

binutils-tools is buildable but not sure if it is usable:

	$ pwd
	nix-lfs
	$ nix-build -A tools.binutils
