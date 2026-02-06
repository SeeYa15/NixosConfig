{pkgs, lib, config, ...}:{
    environment.systemPackages = with pkgs; 
    [
        azuredatastudio
    ];
}