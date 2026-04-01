{config, inputs, lib, pkgs, ...}:{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    source = ../Shared/homemanager/neovim;
    recursive = true;
  };
}
