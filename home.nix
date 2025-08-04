{ config, pkgs, inputs, lib,  ...}:
{
  home.username = "johnnys";
  home.homeDirectory = "/home/johnnys";
  home.file.".config/waybar/style.css".source = ./homemanager/waybar/style.css;

  home.packages = with pkgs; [
    neofetch
      nnn
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
      playerctl
      brightnessctl
      wireplumber
      wl-clipboard
      blueman
      networkmanagerapplet
      pavucontrol
      pulseaudio
      python3Full
      desktop-file-utils
      ranger
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

  xdg.enable = true;
#General programs. Enable.
  programs = {
    ranger.enable = true;
    fzf= {
      enable = true;
      enableBashIntegration = true;
    };
    yazi.enable = true;
  };

#FUZZEL
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
