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
    asciicam
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

    dotnet-sdk_6
    dotnet-sdk_7
    dotnet-sdk_8
    dotnet-sdk_9
  ];



  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.spicetify-nix.homeManagerModules.default
      ./waybar/waybar.nix
      ./hyprland/hyprland.nix
      ./lf/lf.nix
      ./hyprpaper/hyprpaper.nix
      ./tmux/tmux.nix
      ./neovim/nixvim.nix
      ./spicetify/spicetify.nix
      ./wofi/wofi.nix
      ./zsh/zsh.nix
      ./btop/btop.nix
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
