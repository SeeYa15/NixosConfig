{inputs, lib, pkgs, config, ...} : {

  home.packages = [pkgs.waybar];

  home.file.".config/waybar/style.css".source = ./chatgptstyle.css;
  home.file.".config/waybar/power_menu.xml".source = ./power_menu.xml;

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
          "custom/power"
        ];
        "hyprland/language" = {
          format = "Lang:{short}";
          format-se = "SE";
          format-en = "US";
          # keyboard-name="squalius-cephalus-silakka54";
          keyboard-name="";
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
          # persistent-workspaces = {
          #   "*" = 5;
          # };
        };
      "custom/power" = {
        format = "⏻";
        tooltip= false;
        menu = "on-click";
        menu-file = "~/.config/waybar/power_menu.xml";
        menu-actions = {
            shutdown = "poweroff";
            reboot = "reboot";
            suspend = "systemctl suspend";
            hibernate = "systemctl hibernate";
        };
      };

# Audio configuration
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          format-icons = {
            default = ["" ""];
          };
          on-click = "pavucontrol";
          tooltip = false;
        };

        network = {
          interface = "wlp5s0";
          format = "{icon}";
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰈁 {ifname}";
          format-disconnected = "{}"; #An empty format will hide the module.
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{signalStrength}%";
          tooltip-format-ethernet = "{ipaddr}/{bandwidthTotalBits}";
          format-icons = ["󰖩"];
          #format-icons = ["󰖩" "󰤥" "󰤢" "󰤟" "󱚼"];
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
