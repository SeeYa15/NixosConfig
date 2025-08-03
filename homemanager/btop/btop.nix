{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
  ];

  xdg.desktopEntries.btop = {
    name = "btop";
    comment = "Resource monitor";
    exec = "kitty -e btop"; 
    icon = "htop";
    terminal = true;
    categories = [ "System" "Monitor" ];
  };
}
