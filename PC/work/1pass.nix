{ inputs, lib, pkgs, config, outputs, ... }: {
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "johnnys" ];
  };

  programs._1password.enable = true;