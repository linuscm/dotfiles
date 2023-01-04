{
  programs.starship = {
    enable = true;
    settings = {
      # Style
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };

      # Other
      add_newline = false;
    };
  };
}
