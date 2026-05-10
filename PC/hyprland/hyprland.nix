
{pkgs, inputs, config, lib, ... } : 
{

  #WAYLAND
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    settings = {
      exec-once = [
        "waybar"
        "nm-applet --indicator"
        "blueman-applet"
        "swww-daemon"
      ];

      input = {
          kb_layout = "se,us";
          kb_variant = "nodeadkeys,";
          kb_options = "grp:win_space_toggle";
      };

      monitor = [
        "DP-1, 2560x1440@59.95Hz, 0x0, 1" 
      ];
      

      
      #Master Layout
      master = {
        special_scale_factor = 0.5;
        allow_small_split = true;
        mfact = 0.70;
        orientation = "top";
      };

      #Decoration
      decoration = {
        inactive_opacity = 0.8;
        active_opacity = 1;
        fullscreen_opacity = 1;
      };
      dwindle = {
        force_split = 0;
        preserve_split = true;
        smart_split = false;
        smart_resizing = true;
        permanent_direction_override = false;
        special_scale_factor = 0.8;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        default_split_ratio = 1.0;
        split_bias = 0;

      };
      #workspaces and monitor
      workspace = [ 
        "1,name:General, monitor:DP-1, default:true"
        "2,name:Media, monitor:DP-1, default:true"
        "3,name:Work, monitor:DP-1, default:false"
        "4,name:Extra, monitor:DP-1, default:false"
        "5,name:Relax, monitor:DP-1, default:false"
      ];

      "$mod"="SUPER";

      bind = [

        
        "$mod, SUPER_L, exec, pkill wofi || wofi --show drun"
        "$mod, Q, exec, kitty"
        "$mod, C, killactive"
        "$mod, E, exec, kitty -e yazi"
        "$mod SHIFT, S, exec, grimblast copysave area"
        "$mod, F, fullscreen"
        "$mod CTRL, S, exec, grimblast save area - | satty --filename -"
        "$mod CTRL, N, exec, kitty -e nvim ."
        "$mod, V, togglefloating"
        "$mod, P, pseudo"
        "$mod, T, layoutmsg, togglesplit"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 6"
        "$mod SHIFT, 5, movetoworkspace, 6"
        
        "$mod CTRL, Right, movecurrentworkspacetomonitor, +1"
        "$mod CTRL, Left, movecurrentworkspacetomonitor, -1"

        "$mod SHIFT, Left, movewindow, l"
        "$mod SHIFT, Right, movewindow, r"
        "$mod SHIFT, Up, movewindow, u"
        "$mod SHIFT, Down, movewindow, d"
        
        "$mod, Left, movefocus, l"
        "$mod, Right, movefocus, r"
        "$mod, Up, movefocus, u"
        "$mod, Down, movefocus, d"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioRaiseVolume, exec, notify-send ' ' -a 'Volume' -h string:x-dunst-stack-tag:audio -h int:value:$(awk '{printf(\"%d\", 100 * $2)}' <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@))"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioLowerVolume, exec, notify-send ' ' -a 'Volume' -h string:x-dunst-stack-tag:audio -h int:value:$(awk '{printf(\"%d\", 100 * $2)}' <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@))"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessUp, exec, notify-send ' ' -a 'Brightness' -h string:x-dunst-stack-tag:brightness -h int:value:$(awk '{printf(\"%d\", $1 / 19393.0 * 100)}' <<< $(brightnessctl get))"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessDown, exec, notify-send ' ' -a 'Brightness' -h string:x-dunst-stack-tag:brightness -h int:value:$(awk '{printf(\"%d\", $1 / 19393.0 * 100)}' <<< $(brightnessctl get))"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # mouse
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };

  };
}
