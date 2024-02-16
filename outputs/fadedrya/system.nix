{ pkgs, ... }: {
  imports = [ ./hardware.nix ];

  system.stateVersion = "23.05";

  nix = {
    optimise.automatic = true;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  time.timeZone = "America/Phoenix";
  i18n.defaultLocale = "en_US.UTF-8";

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    curl
    git
    zip
    unzip
    htop
    tree
    jq
    dolphin-emu
  ];

  programs.zsh.enable = true;
  programs.dconf.enable = true;
  virtualisation.docker.enable = true;
  programs.hyprland.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
      args = [ "--expose-wayland" ];
    };
    remotePlay.openFirewall = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.ControllerMode = "bredr";
  };

  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  services.logind.lidSwitch = "ignore";

  services.kmscon.enable = true;

  users.users = rec {
    nathan = ben;
    ben = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "video" "audio" "networkmanager" "docker" ];
    };
  };

}
