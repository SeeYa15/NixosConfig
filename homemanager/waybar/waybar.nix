{inputs, lib, pkgs, config, ...} : {

  home.packages = [pkgs.waybar];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 35;
        spacing = 8;
        margin-top = 8;
        margin-left = 12;
        margin-right = 12;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [ 
          "clock"
        ];

        modules-right = [
          "hyprland/language"
          "pulseaudio"
          "network"
          "battery"
          "tray"
        ];
        "hyprland/language" = {
          format = "Lang:{short}";
          tooltip = true;
          on-click = {};
          min-length = 7;
        };
# Workspace configuration
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "default" = "";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

# Audio configuration
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󱡏";
            headset = "󰋎";
            speaker = "󰽟";
            #phone = "";
            #portable = "";
            #car = "";
            #default = ["" "" ""];
          };
          on-click = "pavucontrol";

          #on-click = "~/.local/bin/volume-slider.sh";
          tooltip = false;
        };

        network = {
          interface = "wlp5s0";
          format = "{icon}";
          format-wifi = "{essid} {icon}";
          format-ethernet = "󰈁 {ifname}";
          format-disconnected = "{}"; #An empty format will hide the module.
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{signalStrength}%";
          tooltip-format-ethernet = "{ipaddr}/{bandwidthTotalBits}";
          format-icons = ["󰖩" "󰤥" "󰤢" "󰤟" "󱚼"];
          on-click = "nm-connection-editor";
          max-length = 50;
        };


# Clock configuration
        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

# Battery configuration
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

# System tray
        tray = {
          icon-size = 18;
          spacing = 8;
        };
      };
    };
  };
}
