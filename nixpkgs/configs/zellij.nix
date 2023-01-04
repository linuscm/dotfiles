let
  common = import ../common.nix;
  color = common.colorscheme.color;
in {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "main-theme";

      default_layout = "compact";
      pane_frames = false;

      themes.main-theme = {
        fg = color.fujiWhite;
        bg = color.sumiInk1;

        black = color.sumiInk0;
        red = color.autumnRed;
        green = color.autumnGreen;
        yellow = color.boatYellow2;
        blue = color.crystalBlue;
        magenta = color.oniViolet;
        cyan = color.waveAqua2;
        white = color.oldWhite;
        orange = color.boatYellow1;
      };
    };
  };
}
