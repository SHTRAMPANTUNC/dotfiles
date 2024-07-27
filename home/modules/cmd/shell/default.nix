{
  pkgs
  ,...
}: {
  imports = [
    ./starship.nix
  ];
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting

        function fish_user_key_bindings
          fish_vi_key_bindings
        end

        set -g -x MYVIMRC "/etc/nixos/MyNixOS/home/modules/editor/config"

        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
      '';
      shellAliases = {
        tree = "eza --tree -L 3";
        l = "eza --icons -F -H --group-directories-first --git";
        ll = "eza --icons -F -H --group-directories-first --git -all";
        pfetch = "nix run nixpkgs#pfetch";
      };
      plugins = [
        {
          name = "autopair";
          inherit (pkgs.fishPlugins.autopair) src;
        }
      ];
    };
  };
}
