# hsfnord
a starter template for haskell projects

## use it 

Install nixpkgs:
```sh
$ curl https://nixos.org/nix/install | sh
```
Install some tools:
```sh
$ nix-env -i cabal-install entr silver-searcher
```
Get started right away with:
```sh
$ bash ./scripts/restart
```

Configure cabal with your nix env with:
```sh
$ bash ./scripts/reload
```

Compile the project with:
```sh
$ bash ./scripts/build
```

Recompile upon save with:
```sh
$ bash ./scripts/watch
```

## (optional) using literate markdown
Install a tool for translating markdown to literate haskell:
```sh
$ nix-env -iA nixpkgs.haskellPackages.markdown-unlit
```
Create a symlink to your markdown file. It should have an .lhs extension:
```sh
$ ln -s Main.md Main.lhs
```
Run with:
```sh
$ runghc -pgmL markdown-unlit Main.md
```
Or recompile on change with:
```sh
$ bash ./scripts/watch
```
