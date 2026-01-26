{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    mouse = true;
    prefix = "C-x";
    escapeTime = 0;
    disableConfirmationPrompt = true;

    extraConfig = ''
      set -g default-terminal "$TERM"
      set -ag terminal-overrides ",$TERM:Tc"
      set -g status-position top
      set -g status-justify left
      set -g status-right ""
      set -g pane-border-lines heavy
      set -g window-status-format " #I:#W "
    '';
  };
}

#set -g status-style "bg=#${config.colorScheme.palette.base01}"
#set -g window-status-current-format "#[bg=#${config.colorScheme.palette.base0A},fg=#${config.colorScheme.palette.base00}] #I:#W "
