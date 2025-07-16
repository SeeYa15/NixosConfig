{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      primary = {
        layer = "top";
        position = "bottom";
        margin = "5 20 15 20";
        height = 40;
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "battery" "clock" ];

        clock = {
          format = "{:%H:%M %a %d}";
          tooltip-format = "<tt>{calendar}</tt>";
          tooltip = true;

          calendar = {
            format = {
              today = "<span color='#${config.colorScheme.palette.base0B}'><b>{}</b></span>";
            };
          };
        };

        battery = {
          bat = "BAT0";
        };

        tray = {
          spacing = 8;
        };

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 5;
          };
        };
      };
    };

    style = ''
      * {
        font-family: Noto Sans;
        font-size: 14px;
        font-weight: bold;
      }

      window#waybar {
        background-color: transparent;
      }

      #workspaces, #clock, #battery, #tray {
        background-color: #${config.colorScheme.palette.base00};
        border-radius: 5px;
      }

      #workspaces {
        padding: 5px 10px;
      }

      #workspaces button {
        color: #${config.colorScheme.palette.base02};
        padding: 3px;
      }

      #workspaces button.focused,
      #workspaces button.active {
        color: #${config.colorScheme.palette.base05};
      }

      #clock, #battery, #tray {
        color: #${config.colorScheme.palette.base05};
        padding: 5px 15px;
      }

      #battery {
        padding-right: 0;
      }

      #tray {
        margin-right: 13px;
      }
    '';
  };
}
