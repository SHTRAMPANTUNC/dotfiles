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
  };

  home = {
    packages = with pkgs; [
      # Desk
      zathura
      vesktop
      obsidian
      tdesktop
      #Dev
      go
      clang
      lldb
    ];
  };
}
