{ flakeInputs, pkgs, usrDrv, ... }@args: {
  nixosConfigurations.fadedrya = flakeInputs.nixpkgs-unstable.lib.nixosSystem {
    inherit pkgs;
    inherit (pkgs) system;
    specialArgs = args;
    modules = [ ./system.nix { networking.hostName = "fadedrya"; } ];
  };
}