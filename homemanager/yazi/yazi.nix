
{inputs, lib, pkgs, config, ...} : {
  programs.yazi = {
    enable = true;

    xdg.desktopEntries.lf = {
      name = "Yazi Terminal File Manager";  # More descriptive name
      comment = "Terminal file manager";
      exec = "yazi -e lf";
      icon = "yazi";
      terminal = false; 
      categories = [ "System" "FileManager" "FileTools" ];
      mimeType = [ "inode/directory" ];  # Optional: associate with directories
    };
  };
}
