{config, pkgs, lib, ...}:
{
    home = {
        username = "ca82pez";
        homeDirectory = "/home/ca82pez/";
        stateVersion = "22.11"; # das darf NIEMALS veraendert werden, sondern bezeichnet den startpunkt des nix-seins
    };

    programs.bash.bashrcExtra = ''
      source /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh      
    '';
}
