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
      ];


      #      windowrulev2 = [
      #        "float,class:^(Spotify)$"
      #        "center,class:^(Spotify)$"
      #        "size 800 600,class:^(Spotify)$"
      #      ];
      
      windowrulev2 = [ 
        "tag:yazi, class:^(kitty)$,title:Yazi"
      ];

      input = {
          kb_layout = "se,us";
          kb_variant = "nodeadkeys,";
          kb_options = "grp:win_space_toggle";
      };

      #Master Layout
      master = {
        special_scale_factor = 0.5;
        allow_small_split = true;
        mfact = 0.70;
        orientation = "left";
      };

      #Decoration
      decoration = {
        inactive_opacity = 0.8;
        active_opacity = 1;
        fullscreen_opacity = 1;

      };
      #      monitor = [
      #        "HDMI-A-1,preferred,auto,1"
      #        "eDP-1,preferred,auto,1"
      #      ];

      #workspaces and monitor
      workspace = [ 
        "1,name:General, monitor:DP-1, default:true"
        "2,name:Media, monitor:DP-1, default:true"
        "3,name:Work, monitor:DP-1, default:true"
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
        "CTRL, N, exec, kitty -e nvim ."
        #"$mod, E, exec, hyprctl dispatch focuswindow tag:yazi || kitty --title yazi -e yazi"

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
