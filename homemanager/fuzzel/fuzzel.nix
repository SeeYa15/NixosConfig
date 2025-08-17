
{inputs, lib, pkgs, config, ...} : {
  programs.fuzzel = {

    enable = true;

    settings = {
      main = {
        layer = "overlay";
        terminal = "kitty";
        font = "Noto Sans:size=18";
        prompt = "\"   \"";
        dpi-aware = "no";
        horizontal-pad = 35;
        vertical-pad = 20;
        inner-pad = 15;
        width = 20;
      };
    };
  };
}
