{ pkgs, lib, config, ... }: {
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
          ms-dotnettools.csdevkit
          ms-dotnettools.csharp
          ms-vscode-remote.remote-containers
          ms-vscode.theme-tomorrowkit
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
          patcx.vscode-nuget-gallery
          github.codespaces
        ];

        # keybindings = [
        #   {
        #     key = "ctrl+'";
        #     command = "editor.action.commentLine";
        #     when = "editorTextFocus && !editorReadonly";
        #   }

        #   {
        #     key = "ctrl+shift+d";
        #     command = "editor.action.copyLinesDownAction";
        #     when = "editorTextFocus && !editorReadOnly";
        #   }

        #   {
        #     key = "ctrl+alt+s";
        #     command = "workbench.action.files.saveAll";
        #   }

        #   {
        #     key = "ctrl+[Semicolon]";
        #     command = "workbench.action.togglePanel";
        #   }

        #   {
        #     key = "ctrl+j";
        #     command = "workbench.action.terminal.toggleTerminal";
        #   }

        #   {
        #     key = "ctrl+shift+j";
        #     command = "workbench.action.terminal.new";
        #   }
        # ];

        userSettings = {
          "workbench.colorTheme" = "Tomorrow Night";
          "dev.containers.dockerPath" = "podman";
          "dev.container.dockerSocketPath" = "/run/user/1000/podman/podman.sock";
          "explorer.confirmDragAndDrop" = false;
          "remote.restoreForwardedPorts" = false;
          "remote.autoForwardPortsSource" = "hybrid";
          "update.mode" = "none";
          "extensions.ignoreRecommendations" = true;
          "extensions.autoUpdate" = false;
          "workbench.startupEditor" = "none";
          "editor.codeLens" = false;
          "editor.inlineSuggest.enabled" = false;
          "editor.inlayHints.enabled" = "off";
          "editor.smoothScrolling" = true;
          "dotnet.formatting.organizeImportsOnFormat" = true;
          "terminal.integrated.defaultProfile.linux" = "zsh";
          "telemetry.telemetryLevel" = "off";
          "git.enableSmartCommit" = true;
          "workbench.secondarySideBar.defaultVisibility" = "hidden";
        };
      };
    };
  };
}