{ pkgs ? import <nixpkgs> {} } :

with pkgs;

python3Packages.buildPythonPackage rec {
    # disabled = ! isPy3k;
    name = "grammalecte";
    version = "v0.5.17";

    doCheck = true;
    
    src = pkgs.fetchurl {
      url = "http://www.dicollecte.org/grammalecte/oxt/Grammalecte-fr-${version}.zip";
      sha256 = "0ccvj8p8bwvrj8bp370dzjs16pwm755a7364lvk8bp4505n7g0b6";
    };

    propagatedBuildInputs = with python3Packages; [ bottle ];

    preBuild = "cd ..";
    postInstall = ''
      mkdir $out/bin
      cp $out/cli.py $out/bin/gramalecte
      cp $out/server.py $out/bin/gramalected
      chmod a+rx $out/bin/gramalecte
      chmod a+rx $out/bin/gramalected
    '';

   meta = {
      description = "Grammalecte est un correcteur grammatical open source dédié à la langue française.";
      homepage = "https://dicollecte.org/grammalecte/";
      # license = licenses.gpl3;
      # maintainers = with maintainers; [ apeyroux ];
    };
}
