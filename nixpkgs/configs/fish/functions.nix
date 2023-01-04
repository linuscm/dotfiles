{
  programs.fish.functions = {
    # Update system
    us = "
      set currentDir (pwd)
      cd ~/dotfiles
      git pull
      ./setup
      cd $currentDir
    ";

    # Zellij run command in window
    zjc.body = "command zellij run --name \"$argv\" --floating -- fish -c \"$argv\"";
  };
}
