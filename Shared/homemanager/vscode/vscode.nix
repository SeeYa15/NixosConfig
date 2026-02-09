{inputs, pkgs, lib, config, ... }: 
let
  extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system};
in
{
  
  programs.vscode = {
    enable = true;
    nixpkgs.config.allowUnfree = true;
    profiles = {
      default = {
        extensions = with extensions.vscode-marketplace; [
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