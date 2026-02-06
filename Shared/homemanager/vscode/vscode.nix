{ pkgs, lib, config, ... }: {
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          ms-dotnettools.csdevkit
          ms-dotnettools.csharp
          ms-vscode-remote.remote-containers
          ms-vscode.theme-tomorrowkit
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
          github.codespaces
        ];
      };
    };
  };
}