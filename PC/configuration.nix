
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware/hardware-configuration.nix
      ./work/1pass.nix
      # ./work/devcontainer.nix
    ];
  
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelParams = ["nvidia-drm.modeset=1" "initcall_blacklist=simpledrm_platform_driver_init"];
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 config.boot.kernelPackages.evdi ];
    initrd = {
      kernelModules = ["evdi"];
    };
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  networking = {
    hostName = "bojje-pc";
    networkmanager.enable = true;
  };
  # networking.hostName = "bojje-pc"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;
  # Nix options
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };
  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };


  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.johnnys = {
    isNormalUser = true;
    description = "Johnny Svensson";
    extraGroups = [ "networkmanager" "wheel" "dialout" "tty" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
  #Add so that I can find Silakka54 in Vial
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="0000", MODE="0666"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  # OpenGL
  hardware.opengl = {
    enable = true;
  };

  # AMD (display owner)
  # services.xserver.videoDrivers = [ "amdgpu" ];

  # NVIDIA (render offload)
  hardware.nvidia = {
    modesetting.enable = true;   # REQUIRED for Wayland
    powerManagement.enable = false;
    open = true;

    prime = {
      offload.enable = true;
      amdgpuBusId = "PCI:17:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };


  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.zsh.enable = true;
  systemd = {
    services.dlm.wantedBy = ["multi-user.target"];
  };
  services = {
    xserver =  {
      xkb = {
        layout = "se, us";
        variant = "nodeadkeys";

      };
      videoDrivers = [
        "displaylink"
        "amdgpu" 
        "nvidia"];
    };
    getty.autologinUser = "johnnys";
    dbus.enable = true;
    seatd.enable = true;
    blueman.enable = true;
    greetd = {
      enable = true;
      settings = {
        ## Initial_session as an autologin tool. It starts first. Then default session will start
        ## https://man.sr.ht/~kennylevinsen/greetd/#setting-up-auto-login
        #       	  initial_session = {
        #       		  command = "Hyprland";
        #       		  user = "johnnys";
        #       	  };

        default_session = {
          user = "greeter";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland"; 
        };
      }; 
    };
    displayManager = {
      enable = true;
      defaultSession = "hyprland";
    };
  };
  virtualisation.docker = {
    enable = true;
  };

# Optional: Add your user to the "docker" group to run docker without sudo
users.users.johnnys.extraGroups = [ "docker" ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    w3m 
    slack
    firefox
    brave
    chromium
    greetd.tuigreet #Login
    usbutils 
    displaylink
    vscode
    azuredatastudio
    devcontainer
    docker
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.bigblue-terminal
    nerd-fonts.symbols-only
    nerd-fonts.proggy-clean-tt
    nerd-fonts.jetbrains-mono
    nerd-fonts.dejavu-sans-mono
    font-awesome
  ];
  fonts = {
    enableDefaultFonts = true;
    fontconfig.enable = true;
  };


  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
	
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
