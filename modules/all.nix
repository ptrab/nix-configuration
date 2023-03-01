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
      };
      # See also https://scriptim.github.io/bash-prompt-generator/ for help
      # einfach ein String, den er mit in die .bashrc reinschreibt
      initExtra = ''
        PS1='\[\e[0;1;38;5;214m\]\u\[\e[0;1m\]@\[\e[0;1;38;5;214m\]\h\[\e[0;1m\]:\[\e[0;1;38;5;75m\]\w\[\e[0;1m\]$ \[\e[0m\]'
        force_color_prompt=yes
      '';
    };

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
    home-manager
    nano
    btop
    vim
  ];
}
