{
  config,
  lib,
  ...
}: let
  common = import ../../common.nix;
  color = lib.mapAttrs (k: v: builtins.substring 1 6 v) common.colorscheme.color;
in {
  programs.fish.shellInit = ''
    # Set TTY colors
    if [ "$TERM" = "linux" ]
      # Dark colors
      printf '\033]P0${color.sumiInk0}';
      printf '\033]P1${color.autumnRed}';
      printf '\033]P2${color.autumnGreen}';
      printf '\033]P3${color.boatYellow2}';
      printf '\033]P4${color.crystalBlue}';
      printf '\033]P5${color.oniViolet}';
      printf '\033]P6${color.waveAqua2}';
      printf '\033]P7${color.oldWhite}';

      # Bright colors
      printf '\033]P8${color.fujiGray}';
      printf '\033]P9${color.samuraiRed}';
      printf '\033]PA${color.springGreen}';
      printf '\033]PB${color.carpYellow}';
      printf '\033]PC${color.springBlue}';
      printf '\033]PD${color.springViolet1}';
      printf '\033]PE${color.waveAqua2}';
      printf '\033]PF${color.fujiWhite}';
      clear;
    end

    # Disable greeting
    set -U fish_greeting

    # Colorscheme
    set fish_color_normal normal
    set fish_color_command --bold
    set fish_color_param cyan
    set fish_color_redirection brblue
    set fish_color_comment red
    set fish_color_error brred
    set fish_color_escape bryellow --bold
    set fish_color_operator bryellow
    set fish_color_end brmagenta
    set fish_color_quote yellow
    set fish_color_autosuggestion 555 brblack
    set fish_color_user brgreen
  '';
}
