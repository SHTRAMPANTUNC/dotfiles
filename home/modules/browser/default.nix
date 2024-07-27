{
  pkgs
  ,...
}: {
  programs = {
    chromium = {
      enable = true;
      package = pkgs.google-chrome;
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--ozone-platform-hint=auto"
        "--ignore-gpu-blocklist"
      ];
    };
  };
}
