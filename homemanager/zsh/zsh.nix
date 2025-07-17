{inputs, lib, pkgs, config, ...} : {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [ "git" "z" "sudo" ];
    };
    shellAliases = {
      ls = "ls -lah --color";
      gs = "git status";
      nixb = "sudo nixos-rebuild switch --flake #johnny-home --show-trace";
    };
  };
}

