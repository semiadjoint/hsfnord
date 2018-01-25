{ mkDerivation, array, async, base, base64-bytestring, bytestring
, config-ini, containers, deepseq, directory, fast-logger, filepath
, lens, mtl, optparse-applicative, process, prometheus, protolude
, semigroups, stdenv, stm, text, transformers, unix
, unordered-containers, vector
}:
mkDerivation {
  pname = "project0";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    array async base base64-bytestring bytestring config-ini containers
    deepseq directory fast-logger filepath lens mtl
    optparse-applicative process prometheus protolude semigroups stm
    text transformers unix unordered-containers vector
  ];
  license = stdenv.lib.licenses.bsd3;
}
