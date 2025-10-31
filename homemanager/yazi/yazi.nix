
{inputs, lib, pkgs, config, ...} : {

  programs.yazi = {
    enable = true;
    mgr = {
      show_hidden = true;
      sort_by = "mtime";
      sort_dir_first = true;
    };
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
