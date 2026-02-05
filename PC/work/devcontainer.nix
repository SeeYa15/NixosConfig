{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.devcontainer = {
    enable = true;
  };
}
