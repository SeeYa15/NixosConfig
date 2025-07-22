
{ config, pkgs, inputs, lib,  ...}:{
  home.packages = [pkgs.wofi];

  programs.wofi  = {
    enable = true; 
  };
}
