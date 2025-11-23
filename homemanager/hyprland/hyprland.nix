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
        orientation = "top";
      };

      #Decoration
      decoration = {
        inactive_opacity = 0.8;
        active_opacity = 1;
        fullscreen_opacity = 1;

      };

      dwindle = {
        pseudotile = true;
      };
      #workspaces and monitor
      workspace = [ 
        "1,name:FirstClass, monitor:eDP-1, default:false"
        "1,name:General, monitor:DVI-I-1, default:true"
        "2,name:Media, monitor:DVI-I-1, default:true"
        "3,name:Work, monitor:DVI-I-1, default:true"
        "4,name:Extra, monitor:DVI-I-2, default:true"
        "5, monitor:DVI-I-2, default:false"
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
