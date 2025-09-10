
{inputs, lib, pkgs, config, ...} : {

  programs.yazi = {
    enable = true;
  };

  
  xdg.desktopEntries.yazi = {
    name = "Yazi Terminal File Manager";  # More descriptive name
    comment = "Terminal file manager";
    exec = "kitty -e yazi";
    icon = "yazi";
    terminal = false; 
    categories = [ "System" "FileManager" "FileTools" ];
    mimeType = [ "inode/directory" ];  # Optional: associate with directories
  };
}
