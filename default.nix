{
  stdenv,
  cmake,
  zathura,
  typst,
  makeFontsConf,
  source-sans,
  source-sans-pro,
  roboto,
  font-awesome,
  lib,
  poppler-utils,
}:
let
  fontsConf = makeFontsConf {
    fontDirectories = [ 
      source-sans 
      source-sans-pro
      roboto 
      font-awesome 
    ];
  };
  typstEnv = typst.withPackages (ps: with ps; [
    modern-cv
  ]);
in stdenv.mkDerivation rec {
  pname = "resume";
  version = "2026.10";
  src = ./.;
  nativeBuildInputs = [
    cmake
    zathura
    typstEnv
  ];
  cmakeFlags = [
    (lib.cmakeFeature "VERSION" "${version}")
  ];
  doCheck = true;
  checkPhase = ''
    ls -la
    pages=$(${poppler-utils}/bin/pdfinfo KeatonClarkResume.pdf | awk '/^Pages:/ { print $2 }')
    if [ "$pages" != "1" ]; then
      echo "This resume should only have 1 page, got $pages"
      exit 1
    fi
  '';
  FONTCONFIG_FILE = fontsConf;
  shellHook = ''
    echo "To configure:"
    echo -e '\tcmake -Bbuild $(echo $cmakeFlags)'
    echo 
  '';
}
