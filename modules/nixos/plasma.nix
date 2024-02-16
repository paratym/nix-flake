{ lib, pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5 = {
    enable = true;
    bigscreen.enable = true;
  };
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  environment.plasma5.excludePackages = with pkgs; with pkgs.libsForQt5; [
    aha
    plasma-browser-integration
    konsole
    oxygen
    (lib.getBin qttools)
  ];
}
