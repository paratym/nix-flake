{ flakeInputs, pkgs, usrDrv, ... }@args: {
  nixosConfigurations.fadedrya = flakeInputs.nixpkgs-unstable.lib.nixosSystem {
    inherit pkgs;
    inherit (pkgs) system;
    specialArgs = args;
    modules = [
      ./system.nix
      ../../modules/nixos/nvidia.nix
      ../../modules/nixos/plasma.nix
      ../../modules/nixos/postgres.nix
      { networking.hostName = "fadedrya"; }
    ];
  };
}
