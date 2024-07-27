{
  pkgs
  ,...
}: {
  home = {
    packages = with pkgs; [libsixel chafa];
    sessionVariables.TERMINAL = "foot";
  };

  programs = {
    foot = {
      enable = true;
      settings = {
        main = {
          font = "JetBrainsMono Nerd Font:size=13.5";
          dpi-aware = "yes";
          line-height = 23;
        };
        mouse = {hide-when-typing = "yes";};
        cursor = {
          style = "beam";
          color = "1C1C1E AEAEB2";
          beam-thickness = 1;
        };
        url = {
          launch = "xdg-open \${url}";
          label-letters = "sadfjklewcmpgh";
          osc8-underline = "url-mode";
          protocols = "http, https, ftp, ftps, file, gemini, gopher, irc, ircs";
          uri-characters = ''
            abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]'';
        };

        colors = {
          background = "151515";
          foreground = "E8E3E3";
          regular0 = "151515";
          regular1 = "B66467";
          regular2 = "8C977D";
          regular3 = "D9BC8C";
          regular4 = "8DA3B9";
          regular5 = "A988B0";
          regular6 = "8AA6A2";
          regular7 = "E8E3E3";
          bright0 = "424242";
          bright1 = "B66467";
          bright2 = "8C977D";
          bright3 = "D9BC8C";
          bright4 = "8DA3B9";
          bright5 = "A988B0";
          bright6 = "8AA6A2";
          bright7 = "E8E3E3";
        };
      };
    };
  };
}
