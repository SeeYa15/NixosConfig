
{ inputs, lib, pkgs, config, outputs, ... }: {
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        #"${config.home.homeDirectory}/share/wallpapers/wallpaperhaven.jpg"
        
        "${config.home.homeDirectory}/Downloads/tree.jpg"
      ];

      wallpaper = [
        #",${config.home.homeDirectory}/share/wallpapers/wallpaperhaven.jpg"

        ",${config.home.homeDirectory}/Downloads/tree.jpg"
      ];
    };
  };
}
