{
  pkgs 
  ,...
}: {
  programs = {
    tmux = {
      enable = true;
      aggressiveResize = true;
      keyMode = "vi";
      escapeTime = 0;
      baseIndex = 1;
    };
  };
}
