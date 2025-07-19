{inputs, lib, pkgs, config, ...} : {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" "sudo" ];
      extraConfig = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      '';
    };
    shellAliases = {
      ls = "ls -lah --color";
      gs = "git status";
      nixb = "sudo nixos-rebuild switch --flake #johnny-home --show-trace";
    };
  };
}



#{inputs, lib, pkgs, config, ...} : {
#
#  
#  programs.zsh = {
#    enable = true;
#    enableCompletion = true;
#    autosuggestion.enable = true;
#    syntaxHighlighting.enable = true;
#
#    oh-my-zsh = {
#      enable = true;
#      theme = "powerlevel10k/powerlevel10k";
#      plugins = [ "git" "z" "sudo" ];
#    };
#    shellAliases = {
#      ls = "ls -lah --color";
#      gs = "git status";
#      nixb = "sudo nixos-rebuild switch --flake #johnny-home --show-trace";
#    };
#  };
#
#  home.packages = with pkgs; [
#    zsh-powerlevel10k
#  ];
#}

