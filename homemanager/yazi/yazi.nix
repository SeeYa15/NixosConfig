
{inputs, lib, pkgs, config, ...} : {

  programs.yazi = {
    enable = true;

    extraConfig = ''
      [mgr]
      prepend_keymap = [
        # Yank a single file and copy its path to the system clipboard
        { on = "yy", run = "echo {file} | wl-copy", desc = "Yank file path to system clipboard" }

        # Yank multiple selected files
        { on = "Y", run = "echo {selection} | wl-copy", desc = "Yank selected files to system clipboard" }
      ]
    '';
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
