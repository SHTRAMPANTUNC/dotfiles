{
  inputs
  ,pkgs
  ,...
}: {
  disabledModules = [  ];

  imports = [
    ../../modules/cmd
    ../../modules/gtk
    ../../modules/foot
    ../../modules/media
    ../../modules/editor
    ../../modules/browser
    ../../modules/fontconfig
    ../../modules/wayland/windowManager
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (import ../../overlays/prismlauncher.nix)
    ];
  };

  home = {
    packages = with pkgs; [
      zathura
      vesktop
      obsidian
      tdesktop
      # tun2socks
      # prismlauncher
    ];
  };
}
