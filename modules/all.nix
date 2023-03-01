{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  # Account settings.
  accounts.email = {
    accounts = {
      google = {
        primary = true;
        realName = "Philipp Traber";
        address = "draabaar@gmail.com";
        # flavor = "gmail.com";
      };
    };
  };

  # Program specific settings.
  programs = {
    home-manager.enable = true; # der home-manager managt sich selbst

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      userName = "ptrab";
      userEmail = "draabaar@gmail.com";
      package = pkgs.gitFull;
    };

    bash = {
      enable = true;
      shellAliases = { # alle bash aliase, die sonst BEI MIR in der .bashrc stehen
        ll = "ls -lah";
        tailf = "tail -F -n 100 ---disable-inotify";
        ".." = "cd ..";
        "..." = "cd ../..";
        sqpa = "squeue -o \"%.8A %.12P %35j %.10u %.3t %.10M %.6D %.16R %S\"";
        sq = "sqpa -u ca82pez";
        qme = "qsm && sqpa -u ca82pez";
        countme = "qme | grep -v 'JOBID' | awk '{print NR}' | tail -n 1";
        sqa = "squeue";
        si = "sinfo";
        sii = "sinfo | grep \"idle\"";
        sc = "scancel";
        mysacct = "sacct --format=\"JobID,JobName,NodeList,AllocCPU,CPUTime,TotalCPU,MaxRSS,Elapsed,State\" -j";
        fchk09 = "/cluster/apps/g09/g09/formchk -3";
        fchk = "/cluster/apps/g16/g16/formchk";
        unfchk = "/cluster/apps/g16/g16/unfchk";
        g09rr = "/home/ca82pez/scripts/g09rr.py";
        sumnodes = "sh /home/ca82pez/scripts/sumnodes.sh";
        top = "top -u ca82pez";
        testnodes = "sh /home/ca82pez/scripts/testnodes.sh";
        black = "black -l 79";
      };
      # See also https://scriptim.github.io/bash-prompt-generator/ for help
      # einfach ein String, den er mit in die .bashrc reinschreibt
      initExtra = ''
        PS1='\[\e[0;1;38;5;214m\]\u\[\e[0;1m\]@\[\e[0;1;38;5;214m\]\h\[\e[0;1m\]:\[\e[0;1;38;5;75m\]\w\[\e[0;1m\]$ \[\e[0m\]'
        force_color_prompt=yes
      '';
    };

    fish.enable = false;

    tmux = {
      enable = false;
      clock24 = true;
      shortcut = "a";
      # VVVV wieder de-auskommentieren, falls enable = true wird.
      # VVVV dann muss ./dotfiles/tmus.conf aber auch existieren
      # extraConfig = builtins.readFile ./dotfiles/tmux.conf;
    };
  };

  home.packages = with pkgs; [
    htop
    nano
    btop
    vim
  ];
}
