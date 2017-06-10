{ pkgs ? import <nixpkgs> {} } :

with pkgs;

python35Packages.buildPythonPackage rec {
  name = "grammalecte";
  version = "v0.5.17";
  src = fetchurl {
    url = "http://www.dicollecte.org/grammalecte/oxt/Grammalecte-fr-${version}.zip";
    sha256 = "0ccvj8p8bwvrj8bp370dzjs16pwm755a7364lvk8bp4505n7g0b6";
  };
  preBuild = ''cd ..'';
}
