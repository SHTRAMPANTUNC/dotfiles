
{
  pkgs
  ,...
}: {
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["JetBrainsMono"];
        serif = ["Noto Serif"];
        sansSerif = ["Inter"];
      };
    };
    
  };
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    font-awesome
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
}
