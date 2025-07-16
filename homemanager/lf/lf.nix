{ pkgs, lib, config, ... }: let 
    previewerScript = pkgs.writeShellScript "kitty-preview" ''
      file=$1
      w=$2
      h=$3
      x=$4
      y=$5

      if [[ "$( file -Lb --mime-type "$file")" =~ ^image ]]; then
          kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
          exit 1
      fi

      cat "$file"
    '';

    cleanerScript = pkgs.writeShellScript "kitty-clean" ''
      kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
    '';
in {
  programs.lf = {
    enable = true;
    
    previewer.source = previewerScript;

    extraConfig = ''
      set cleaner ${cleanerScript}
    '';
  };
}
