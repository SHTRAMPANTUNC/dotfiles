{
  pkgs
  ,...
}: {
  home = {
    packages = with pkgs; [killall nvtopPackages.amd unzip dust duf];
  };

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [prettybat batman batgrep batdiff];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    eza = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultOptions = ["--border" "--preview 'bat --color=always {}'" "--prompt 'Files> '"];
    };

    ripgrep = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
