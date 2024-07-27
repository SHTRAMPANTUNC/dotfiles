{
  pkgs
  ,...
}: {
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        vscode-langservers-extracted
        lua-language-server
        clang-tools
        docker-ls
        stylua
        gopls
        nil
      ];
    };
  };
  xdg = {
    configFile."nvim" = {
      source = ./config;
      recursive = true;
    };
  };
}
