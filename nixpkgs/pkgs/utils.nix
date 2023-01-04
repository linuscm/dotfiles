{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    httpie
    picocom
    openvpn
    comma
    unzip
    zip
    git
    w3m
    fzf
    mosh
    curl
    wget
    tree
  ];
}
