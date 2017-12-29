{ mkDerivation, base, lens, protolude, stdenv, text }:
mkDerivation {
  pname = "project0";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base lens protolude text ];
  license = stdenv.lib.licenses.bsd3;
}
