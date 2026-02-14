
{ config, pkgs, inputs, lib,  ...}:{

  allowUnfree = true;
  home.username = "johnnys";
  home.homeDirectory = "/home/johnnys";

  home.packages = with pkgs; [
    zip
    fastfetch
    unzip
    ripgrep
    jq

    #Terminal Search Fuzzy Finder
    fzf
    fd 

    mtr #Terminal Network 
    file
    which
    tree
    kitty
    #fuzzel #Used as a program starter. Wofi is being used atm
    vial #Keyboard configure
    hyprpicker
    hyprsunset
    nautilus
    udiskie
    swaynotificationcenter
    wayclip
    discord
    swww
    waypaper
    #System controllers / CTL
    playerctl #Handling music, media player
    brightnessctl #Handling Screen 
    wireplumber
    wl-clipboard
    blueman
    tldr
    networkmanagerapplet
    pavucontrol
    pulseaudio
    pipewire
    swayimg
    yazi
    obs-studio
    satty
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];



  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.spicetify-nix.homeManagerModules.default
      ./waybar/waybar.nix
      ./hyprland/hyprland.nix
      ../Shared/homemanager/vscode/vscode.nix
      ../Shared/homemanager/lf/lf.nix
      ../Shared/homemanager/hyprpaper/hyprpaper.nix
      ../Shared/homemanager/tmux/tmux.nix
      ../Shared/homemanager/neovim/nixvim.nix
      ../Shared/homemanager/spicetify/spicetify.nix
      ../Shared/homemanager/wofi/wofi.nix
      ../Shared/homemanager/zsh/zsh.nix
      ../Shared/homemanager/btop/btop.nix
      ../Shared/homemanager/yazi/yazi.nix
  ];
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userEmail = "johnny.svensson15@gmail.com";
    userName = "Johnny Svensson";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  targets.genericLinux.enable = true;
  xdg.enable = true;
  
  #General programs. Enable.
  programs = {
    fzf= {
      enable = true;
      enableBashIntegration = true;
    };
  };

  fonts.fontconfig.enable = true;
  programs.kitty = {
    enable = true;
    font = {
      name = "BigBlueTermPlus Nerd Font";
    };

    settings = {
      enable_audio_bell = false;
    };
  };
}
