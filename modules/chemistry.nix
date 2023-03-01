{ config, pkgs, qchem, ... }:

{
  home.packages = (with pkgs; [
    avogadro
    avogadro2
    gnuplot_qt
    marvin
  ]) ++ (with pkgs.qchem; [
    xtb
    pegamoid
    gabedit
    molden
    vmd
    ]);
}
