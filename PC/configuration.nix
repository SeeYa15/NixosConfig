
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
# let
#   dotnetCombined = with pkgs.dotnetCorePackages; combinePackages [
#       sdk_8_0
#       sdk_9_0
#       #Using version 10 generates a problem and is the only SDK that is being used if combined with other SDK
#       #sdk_10_0
#       aspnetcore_8_0
#       aspnetcore_9_0
#       #aspnetcore_10_0
#       runtime_8_0
#       runtime_9_0
#       #runtime_10_0
#     ];
# in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware/hardware-configuration.nix
      ./work/1pass.nix
      ../Shared/system/azuredatastudio.nix
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

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
    extraGroups = [ "networkmanager" "wheel" "dialout" "tty" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
  #Add so that I can find Silakka54 in Vial
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="feed", ATTR{idProduct}=="0000", MODE="0666"
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  # OpenGL
  hardware.graphics = {
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
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
    icu
];

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
    mysql = {
      enable = true;
      package = pkgs.mariadb;

      settings = {
        mysqld = {
          bind-address = "127.0.0.1"; # local only
          port = 3306;

          # Nice for development
          general_log = 1;
          general_log_file = "/var/lib/mysql/general.log";
        };
      };
    };

    # Not required for local-only, but safe to omit firewall rule
    # networking.firewall.allowedTCPPorts = [ 3306 ];
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
          command = "${pkgs.tuigreet}/bin/tuigreet --cmd start-hyprland"; 
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
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Allow unfree packages
  # nixpkgs.config = {
  #   allowUnfree = true;
  #   allowUnfreePredicate = true;
  # };

  environment.systemPackages = with pkgs; [
    wget
    w3m 
    slack
    firefox
    brave
    # chromium
    tuigreet #Login
    usbutils 
    displaylink
    devcontainer
    docker
    # dotnetCombined
  ];

  # environment.sessionVariables = {
  #   DOTNET_ROOT = "${dotnetCombined}/share/dotnet";
  # };
  fonts.packages = with pkgs; [
    nerd-fonts.bigblue-terminal
    nerd-fonts.symbols-only
    nerd-fonts.proggy-clean-tt
    nerd-fonts.jetbrains-mono
    nerd-fonts.dejavu-sans-mono
    font-awesome
  ];
  fonts = {
    enableDefaultPackages = true;
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
