{ config, pkgs, qchem, ... }:

{
  home.packages = (with pkgs; [
    avogadro
    avogadro2
    gnuplot_qt
  ]) ++ (with pkgs.qchem; [
    xtb
    pegamoid
    gabedit
    molden
    vmd
    ]);
}
