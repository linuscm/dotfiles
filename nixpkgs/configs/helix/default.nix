let
  common = import ../../common.nix;
  colorscheme = common.colorscheme.helix;
in {
  imports = [./languages.nix];

  programs.helix = {
    enable = true;
    settings = {
      theme = colorscheme;

      editor = {
        scrolloff = 9;
        true-color = true;
        color-modes = true;
        cursorline = true;
        gutters = ["diagnostics" "line-numbers"];
        line-number = "relative";

        # Autocomplete
        idle-timeout = 50;
        completion-trigger-len = 1;

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        statusline = {
          left = ["mode" "spinner" "file-name"];
          right = ["diagnostics" "position"];
        };

        lsp.display-messages = true;
      };
    };
  };
}
