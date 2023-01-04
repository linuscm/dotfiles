# Nix/NixOS configuration
```
  █▀█▒                 █▀█▒
 █  ██▒               █  ██▒
 █ ███▒               █ ███▒
  ███▒  ▆   ▆         ███▒
                            █▒
 ▄██████████████████▄        █▒     █▀▄ █▀█ ▀█▀ █▀▀ █ █   █▀▀ █▀
         ▄▄▄▄▄    ▀███████▀  █▒   ▄ █▄▀ █▄█  █  █▀  █ █▄▄ ██▄ ▄█
                            █▒
```

This repo contains my personal Nix/NixOS configuration, built with Home Manager.


### How I work & structure
My workflow is terminal-centric, using the model editor Helix and terminal multiplexer Zellij as my hammer and sickle
for everyday development. That mixed with my wide range of different hardware, from pure NixOS to remoting into Raspberry
Pi's on the go, meant I've tried to build the config as minimal, flexible and fast as possible.

For ease-of-use, system variables, such as color scheme and font, can be changed in the supplied `common.nix` file.


## Installation
### Before install
Before installation, make sure the dotfiles directory is cloned to the home directory of the user you want to install
the configuration for. Your desired username has to be set in the system `configuration.nix` file.
Then in `./nixpkgs/common.nix` change `user` to fit your choice.

***If you are running a non-NixOS system:*** make sure that Fish is installed and set as your default shell.

### Nix channels
Add the unstable and Home Manager channel before running the setup script. If you're installing under NixOS, add the
channels with `sudo`.

```sh
# NixOS unstable
nix-channel --add https://nixos.org/channels/nixos-unstable nixos

# Nixpkgs unstable (for non NixOS systems)
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs

# Home Manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

# Update channels
nix-channel --update
```

On ***non-NixOS*** systems, enter a Bash shell and export the following path:

```sh
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
```

Then install Home Manager:
```sh
nix-shell '<home-manager>' -A install
```

The `setup` script can now be run to install/update the config.
