{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
    pname = "max-preview-yazi";
    version = "latest";

    src = fetchFromGitHub {
        owner = "yazi-rs";
        repo = "plugins";
        rev = "fb3ae9093bdd06b257516e90acbe73821410d849";
        sha256 = "sha256-mBn29LLHLeeGf2ifwNaonyh0jdSo1goIiIgvgtc4QLE=";
    };

    installPhase = ''
        mkdir -p $out
        cp -r $src/max-preview.yazi/* $out/
    '';
}
