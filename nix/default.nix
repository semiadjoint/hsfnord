{ mkDerivation, array, async, base, base16-bytestring
, base64-bytestring, bytestring, config-ini, containers, deepseq
, directory, fast-logger, filepath, hedgehog, lens, ListLike, mtl
, optparse-applicative, process, prometheus, protolude, semigroups
, stdenv, stm, text, text-icu, transformers, unix
, unordered-containers, utf8-string, vector
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
    ListLike mtl optparse-applicative process prometheus protolude
    semigroups stm text text-icu transformers unix unordered-containers
    utf8-string vector
  ];
  testHaskellDepends = [
    base containers hedgehog mtl text unordered-containers
  ];
  license = stdenv.lib.licenses.bsd3;
}
