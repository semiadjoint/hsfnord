{ mkDerivation, array, async, base, base16-bytestring
, base64-bytestring, bytestring, config-ini, containers, deepseq
, directory, fast-logger, filepath, hedgehog, lens, mtl
, optparse-applicative, process, prometheus, protolude, semigroups
, stdenv, stm, text, transformers, unix, unordered-containers
, vector
}:
mkDerivation {
  pname = "hsfnord";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base ];
  executableHaskellDepends = [
    array async base base16-bytestring base64-bytestring bytestring
    config-ini containers deepseq directory fast-logger filepath lens
    mtl optparse-applicative process prometheus protolude semigroups
    stm text transformers unix unordered-containers vector
  ];
  testHaskellDepends = [
    base containers hedgehog mtl text unordered-containers
  ];
  license = stdenv.lib.licenses.bsd3;
}
