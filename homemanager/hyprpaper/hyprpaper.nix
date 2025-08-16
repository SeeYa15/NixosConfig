
{ inputs, lib, pkgs, config, outputs, ... }: {
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        #"${config.home.homeDirectory}/share/wallpapers/wallpaperhaven.jpg"
        
        "${config.home.homeDirectory}/Downloads/forest-theme.jpg"
      ];

      wallpaper = [
        #",${config.home.homeDirectory}/share/wallpapers/wallpaperhaven.jpg"

        "${config.home.homeDirectory}/Downloads/forest-theme.jpg"
      ];
    };
  };
}
