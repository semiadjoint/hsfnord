{ mkDerivation, array, base, bytestring, deepseq, directory
, ghc-prim, HUnit, icu, QuickCheck, random, stdenv, test-framework
, test-framework-hunit, test-framework-quickcheck2, text
}:
mkDerivation {
  pname = "text-icu";
  version = "0.7.0.1";
  sha256 = "e2764c2749033706eed5b9fb3cda11177ad15cdf11912028f551eca39a2c7f78";
  libraryHaskellDepends = [ base bytestring deepseq text ];
  librarySystemDepends = [ icu ];
  testHaskellDepends = [
    array base bytestring deepseq directory ghc-prim HUnit QuickCheck
    random test-framework test-framework-hunit
    test-framework-quickcheck2 text
  ];
  doCheck = false;
  homepage = "https://github.com/bos/text-icu";
  description = "Bindings to the ICU library";
  license = stdenv.lib.licenses.bsd3;
}
