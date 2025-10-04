{inputs, lib, pkgs, config, ...} : {
  #NIXVIM

  home.packages = with pkgs; [
    csharp-ls
    lua-language-server
    nixd
    clang-tools    # includes clangd
    pyright
  ];


  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.everforest = {
      enable = true;
    };
    # #SET GLOBAL MAPLEADER
    globals = {
      mapleader = " "; #Space
    };
    #NEOVIM OPTIONS
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      clipboard = "unnamedplus";
    };
    autoCmd = {
      
    };


    #PLUGINS#
    plugins = {

      lsp = {
        enable = true;
        servers = {
          csharp_ls.enable = true;
          lua_ls.enable = true;
          clangd.enable = true;
          nixd.enable = true;
          omnisharp.enable = true;
          html.enable = true;
          pyright.enable = true;
        };
        keymaps = {
          diagnostic = {
            "<leader>j" = "goto_next";
          };
          lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";   
          gt = "type_definition";
          "<leader>k" = "code_action";
        };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {

          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip";}
            { name = "path"; }
            { name = "buffer"; }
          ];

          mapping = {
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-leader>" = "cmp.mapping.complete()";
          };
        };

      };
      # Enable the integrations
      cmp-nvim-lsp.enable = true;      # Connects cmp to LSP
      cmp_luasnip.enable = true;       # Connects cmp to snippets
      luasnip.enable = true;           # Snippet engine

      friendly-snippets = {
        enable = true;
      };

      web-devicons ={
        enable = true;
      };

      which-key = {
        enable = true;
      };
      barbar = {
        enable = true;

        keymaps = {
          previous = { key = "<leader>a"; };
          next = { key = "<leader>d"; };
          close = { key = "<leader>w"; };
        };
      };

      telescope = {
        enable = true;
        extensions.ui-select = {
          enable = true;
          settings = {
            specific_opts = {
              codeactions = true;
            };
          };
        };
        keymaps = {
          "<leader><leader>" = "find_files";
          "<leader>fb" = "buffers";
          "<leader>fg" = "live_grep";
          "<leader>fc" = "commands";
        };
      };

      neo-tree = {
        enable = true;

        filesystem = {
          followCurrentFile = {
            enabled = true;
            leaveDirsOpen = true;
          };
        };
      };

      none-ls = {
        enable = true;

        sources = {
          completion = {
            luasnip.enable = true;
            nvim_snippets.enable = true;
            spell.enable = true;
            tags.enable = true;
          };
          diagnostics = {
            cppcheck.enable = true; #C++
            dotenv_linter.enable = true; #DotNet .env-files
            tidy.enable = true; #HTML
            pylint.enable = true;
            deadnix.enable = true;
          };
          formatting = {
            csharpier.enable = true;
            clang_format.enable = true;
            stylua.enable = true;
            prettier.enable = true;
            htmlbeautifier.enable = true;
          };
        };
      };

      treesitter = {
        enable = true;
        autoLoad = true;
        settings = {
          auto_install = true;
          # ensure_installed = "all";
          ensure_installed = [ "c" "cpp" "lua" "python" "nix" "c_sharp" "html" "nix" "tsx" "javascript" ]; # list languages you want

          # Enable highlighting based on Tree-sitter
          highlight.enable = true;

          # Optional: enable indenting via Tree-sitter
          indent.enable = true;

          # Optional: enable incremental selection (visual selection by syntax tree)
          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = false;
              node_incremental = "grn";
              node_decremental = "grm";
              scope_incremental = "grc";
            };
          };
        };
      };
      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts = {
            border = "curved";
            height = 30;
            width = 130;
          };
          open_mapping = "[[<c-\\>]]";
        };
      };
    };
  };
}
