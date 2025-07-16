{ inputs, lib, pkgs, config, outputs, ... }: 
{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
      {
      enable = true;
      theme = spicePkgs.themes.text;
      colorScheme = "Nord";
      #      patches = {
      #        "xpui.js_find_8008" = ",(\\w+=)56";
      #        "xpui.js_repl_8008" = ",\${1}32";
      #      };
      #      injectCss = true;
      #        replaceColors = true;
      #        overwriteAssets = true;
      #        sidebarConfig = true;
    };
}
