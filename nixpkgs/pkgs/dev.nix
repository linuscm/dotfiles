{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # Rust
    rustc
    rust-analyzer
    rustfmt
    cargo

    # Nix
    rnix-lsp
    alejandra

    # Go
    go
    gopls
    gofumpt

    # C
    gcc
    clang-tools

    # .Net
    dotnet-sdk
    omnisharp-roslyn

    # Lua
    lua
    luaformatter
    sumneko-lua-language-server

    # Java- & TypeScript
    deno
    nodejs
    nodePackages.typescript-language-server

    # Python
    (
      let
        my-python-packages = python-packages:
          with python-packages; [
            # HTTP
            urllib3
            requests

            # Python LSP
            python-lsp-server
            jedi
            pylint
            flake8
            rope
            isort
            mypy
          ];
        python-with-my-packages = python3.withPackages my-python-packages;
      in
        python-with-my-packages
    )
    black

    # Bash
    nodePackages.bash-language-server
    shfmt

    # SQL
    sqls

    # General frontend
    nodePackages.svelte-language-server
    nodePackages.vscode-css-languageserver-bin
    nodePackages.prettier
  ];
}
