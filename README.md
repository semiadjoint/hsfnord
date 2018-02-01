# hsfnord
a starter template for haskell projects

## use it 

Install nixpkgs:
```shell
$ curl https://nixos.org/nix/install | sh
```
Install some tools:
```shell
$ nix-env -i cabal-install entr silver-searcher
```
Configure your cabal, compile, and watch for changes:
```shell
bash ./scripts/restart
```

## (optional) using literate markdown
Install a tool for translating markdown to literate haskell:
```shell
$ nix-env -iA nixpkgs.haskellPackages.markdown-unlit
```
Create a symlink to your markdown file. It should have an .lhs extension.
