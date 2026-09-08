 { config, pkgs, ... }:

{
  home.username = "pedro";
  home.homeDirectory = "/home/pedro";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch
    cava
    prismlauncher
    lutris
    cmatrix
    cpu-x
    vesktop
    lavat
    cowsay
    protonup-qt
  ];

  programs.git = {
    enable = true;
    userName = "Pedro";
    userEmail = "Pedro@localhost";
  };

  programs.home-manager.enable = true;
}

