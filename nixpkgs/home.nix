{
  config,
  pkgs,
  ...
}: let
  common = import ./common.nix;
  user = common.user;
in {
  imports = [
    ./configs
    ./pkgs
  ];

  # User
  home.username = user;
  home.homeDirectory = "/home/${user}";

  # XDG
  xdg.userDirs.enable = true;

  # Default editor
  home.sessionVariables.EDITOR = "hx";

  # Home manager version
  home.stateVersion = "22.05";

  # Install home manager
  programs.home-manager.enable = true;
}
