{
  programs.helix = {
    languages = [
      # Compiled
      {
        name = "nix";
        formatter = {
          command = "alejandra";
          args = ["--quiet"];
        };
        auto-format = true;
      }

      {
        name = "c-sharp";
        auto-format = true;
      }

      # Scripting
      {
        name = "python";
        formatter = {
          command = "black";
          args = ["--quiet" "-"];
        };
        auto-format = true;
      }

      {
        name = "lua";
        formatter.command = "lua-format";
        auto-format = true;
      }

      {
        name = "javascript";
        formatter = {
          command = "prettier";
          args = ["--parser" "typescript"];
        };
        auto-format = true;
      }

      {
        name = "typescript";
        formatter = {
          command = "prettier";
          args = ["--parser" "typescript"];
        };
        auto-format = true;
      }

      {
        name = "bash";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
        formatter = {
          command = "shfmt";
          args = ["-i" "4"];
        };
        auto-format = true;
      }

      {
        name = "fish";
        formatter = {command = "fish_indent";};
        auto-format = true;
      }

      # Web
      {
        name = "html";
        formatter = {
          command = "prettier";
          args = ["--parser" "html"];
        };
      }

      {
        name = "css";
        formatter = {
          command = "prettier";
          args = ["--parser" "css"];
        };
        auto-format = true;
      }

      # Other
      {
        name = "json";
        formatter = {
          command = "prettier";
          args = ["--parser" "json"];
        };
      }
    ];
  };
}
