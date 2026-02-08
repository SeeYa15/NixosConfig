{ pkgs, lib, config, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-dotnettools.csdevkit
      ms-dotnettools.csharp
      ms-vscode-remote.remote-containers
      ms-vscode.theme-tomorrowkit
      pkief.material-icon-theme
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      github.codespaces
    ];
  };
}