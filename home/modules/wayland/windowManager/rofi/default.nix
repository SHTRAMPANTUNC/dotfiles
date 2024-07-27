{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./theme.nix
  ];

  programs.rofi = {
    enable = true;
    cycle = false;
    package = pkgs.rofi-wayland;
    location = "center";
    font = "JetBrainsMono Nerd Font 14";
    terminal = "${config.home.sessionVariables.TERMINAL}";
    extraConfig = {
      modi = "drun,run,window";
      display-drun = "APPS";
      display-run = "RUN";
      display-window = "WINDOW";
      drun-display-format = "{name}";
    };
  };
}
