{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg-col = mkLiteral "#242424";
        bg-alt = mkLiteral "#444446";
        bg-col-light = mkLiteral "#222223";
        selected-col = mkLiteral "#AEAEB2";
        fg-col = mkLiteral "#AEAEB2";
        grey = mkLiteral "#7C7C80";

        width = 500;
      };
      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "window" = {
        height = mkLiteral "550px";
        background-color = mkLiteral "@bg-col";
      };

      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };

      "inputbar" = {
        children = map mkLiteral ["prompt" "entry"];
        background-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "3px";
        padding = mkLiteral "2px";
      };

      "prompt" = {
        background-color = mkLiteral "@selected-col";
        padding = mkLiteral "6px";
        text-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "20px 0px 0px 20px";
      };

      "textbox-prompt-colon" = {
        expand = "false";
        str = ":";
      };

      "entry" = {
        padding = mkLiteral "6px";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "20px 10px 0px 10px";
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-alt";
      };

      "listview" = {
        padding = mkLiteral "10px";
        margin = mkLiteral "12px";
        background-color = mkLiteral "@bg-col";
      };

      "element" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col";
      };

      "element-icon" = {size = mkLiteral "25px";};

      "element selected" = {
        background-color = mkLiteral "@selected-col";
        text-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "3px";
      };

      "button" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@selected-col";
      };

      "textbox" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        placeholder-color = mkLiteral "@fg-col";
        blink = true;
        markup = true;
      };
    };
  };
}
