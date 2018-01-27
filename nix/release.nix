let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          hsfnord =
            haskellPackagesNew.callPackage ./default.nix { };

          text-icu =
            haskellPackagesNew.callPackage ./text-icu.nix { };
        };
      };
    };
  };
  pkgs = import <nixpkgs> { inherit config; };
in
  { hsfnord = pkgs.haskellPackages.hsfnord;
  }
