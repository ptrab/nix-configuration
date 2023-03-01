{ config, pkgs, qchem, ... }:

{
  home.packages = (with pkgs; [
    xtb
    pegamoid
    gabedit
    molden
    avogadro
    avogadro2
    gnuplot_qt
    marvin
    vmd
  ]);
}
