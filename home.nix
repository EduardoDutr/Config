{ config, lib, pkgs, user, ...}:

{
  imports = [
    ./windowManager/awesome.nix
    ./windowManager/picom.nix
    ./programs
    ./theming
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 1000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      htop
      kitty
      vscodium
      prismlauncher
      thefuck
      openvpn
      networkmanagerapplet
      bibata-cursors
      catppuccin-gtk
      papirus-icon-theme
      rofi
    ];
    stateVersion = "24.05";
  };
}
