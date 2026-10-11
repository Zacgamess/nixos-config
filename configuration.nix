
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixosgamer"; # Meu Hostname.
  
  # Network.
  networking.networkmanager.enable = true;

  # O Horario (Timezone)
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Suporte pra programas X11 
  services.xserver.enable = true;

  # KDE Plasma (uma das melhores interfaces graficas de distros linux).
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # CUPS Pra Printar
  services.printing.enable = true;
  # Servicos de apps
  systemd.packages = [ pkgs.lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
  # Pipewire (Som).
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };

  # Meu Username.
  users.users."pedro" = {
    isNormalUser = true;
    description = "Pedro Antonio";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Firefox (melhor navegador de todos).
  programs.firefox.enable = true;

  # Apps de Close Source
  nixpkgs.config.allowUnfree = true;
 programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
}; 
  # Lista de apps importantes
  environment.systemPackages = with pkgs; [
   git
   neovim
   vim
   lact
   protontricks
   wget
   unzip
   glib
   winetricks
  ];

  # Versao do sistema
  system.stateVersion = "26.05";

}
