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
        
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      '';
    };
    shellAliases = {
      ls = "ls -lah --color";
      gs = "git status";
      nixb = "sudo nixos-rebuild switch --flake #johnny-home --show-trace";
      nixpush="git add . && git commit -am 'update: $(date + '%Y-%m-%d %H:%M')' && git push";

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

