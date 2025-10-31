{ config, pkgs, inputs, lib,  ...}:
{
  home.username = "johnnys";
  home.homeDirectory = "/home/johnnys";
  # home.file.".config/waybar/style.css".source = ./homemanager/waybar/chatgptstyle.css;

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
    acpi #For checking battery, LID on laptop
    swayimg
    yazi
    obs-studio
    satty
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    #Develop Packages
    #C++ packages
    gcc
    gdb
  ];



  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.spicetify-nix.homeManagerModules.default
      ./homemanager/waybar/waybar.nix
      ./homemanager/hyprland/hyprland.nix
      ./homemanager/lf/lf.nix
      ./homemanager/hyprpaper/hyprpaper.nix
      ./homemanager/tmux/tmux.nix
      ./homemanager/neovim/nixvim.nix
      ./homemanager/spicetify/spicetify.nix
      ./homemanager/wofi/wofi.nix
      ./homemanager/zsh/zsh.nix
      ./homemanager/btop/btop.nix
      ./homemanager/steam/steam.nix
      #./homemanager/fuzzel/fuzzel.nix
      ./homemanager/yazi/yazi.nix
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
