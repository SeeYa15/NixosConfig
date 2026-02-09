{inputs, pkgs, lib, config, ... }: {
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with inputs.nix-vscode-extensions; [
          ms-dotnettools.csdevkit
          ms-dotnettools.csharp
          ms-vscode-remote.remote-containers
          ms-vscode.theme-tomorrowkit
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
          patcx.vscode-nuget-gallery
          github.codespaces
        ];
    # extensions = with pkgs.vscode-extensions; [
    #   ms-dotnettools.csdevkit
    #   ms-dotnettools.csharp
    #   ms-vscode-remote.remote-containers
    #   ms-vscode.theme-tomorrowkit
    #   pkief.material-icon-theme
    #   dbaeumer.vscode-eslint
    #   esbenp.prettier-vscode
    #   github.codespaces
    # ];
  };
};
  };
  }