{
  config,
  pkgs,
  ...
}: let
  user = "lcm";
  hostname = "server";
in {
  imports = [
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

  # --- SYSTEM --- #
  # Use the systemd-boot EFI boot loader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  networking = {
    hostName = "${user}-${hostname}";
    networkmanager.enable = true;
    useDHCP = false;
  };

  time.timeZone = "Europe/Copenhagen";

  i18n.defaultLocale = "en_DK.UTF-8";

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-122n.psf.gz";
    packages = with pkgs; [terminus_font];
    keyMap = "us";
  };

  users.users."${user}" = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = ["docker"];
  };

  # Enable doas instead of sudo
  security.doas.enable = true;
  security.sudo.enable = false;

  # Configure doas
  security.doas.extraRules = [
    {
      users = ["${user}"];
      keepEnv = true;
      persist = true;
    }
  ];

  # --- PACKAGES --- #
  environment.systemPackages = with pkgs; [home-manager];

  # Enable Mosh, opening port 6000 to 61000
  programs.mosh.enable = true;

  # --- SERVICES --- #
  services.openssh.enable = true;
  virtualisation.docker.enable = true;

  # --- SYSTEM VERSION --- #
  system.stateVersion = "22.05";
}
