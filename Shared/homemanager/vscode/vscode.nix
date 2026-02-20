{inputs, pkgs, lib, config, ... }: 
let
  # extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system};
  # extensions = (import pkgs { inherit system; config.allowUnfree = true; overlays = [ nix-vscode-extensions.overlays.default ]; }).nix-vscode-extensions;
in
{
  
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-marketplace; [
          ms-dotnettools.csdevkit
          ms-dotnettools.csharp
          ms-dotnettools.vscode-dotnet-runtime
          ms-vscode-remote.remote-containers
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
          patcx.vscode-nuget-gallery
          github.codespaces
        ];
      };
    };
  };
}