let
pkgs = import <nixpkgs> { };
in
  { hsfnord = pkgs.haskellPackages.callPackage ./default.nix { };
  }
