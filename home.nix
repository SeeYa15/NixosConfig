{ config, pkgs, inputs, lib,  ...}:
{
  home.username = "johnnys";
  home.homeDirectory = "/home/johnnys";
  home.file.".config/waybar/style.css".source = ./homemanager/waybar/style.css;

  home.packages = with pkgs; [
    neofetch
      zip
      unzip
      ripgrep
      jq
      fzf
      fd
      mtr
      iperf3
      file
      which
      tree
      kitty
      fuzzel
      #System controllers / CTL
      playerctl #Handling music, media player
      brightnessctl #Handling Screen
    
      wireplumber
      wl-clipboard
      blueman
      networkmanagerapplet
      pavucontrol
      pulseaudio
      python3Full
      desktop-file-utils
      feh
      gparted
      nix-output-monitor
      yazi
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
      ./homemanager/fuzzel.nix
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
    yazi.enable = true;
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
