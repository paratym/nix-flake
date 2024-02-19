{ pkgs, config, ... }: {
  networking.firewall.allowedTCPPorts = [ config.services.postgresql.port ];
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    enableTCPIP = true;
    settings.ssl = true;
    ensureDatabases = [ "crud" ];
    authentication = pkgs.lib.mkOverride 10 ''
      # type database user   address        auth
      local  all      all                   trust
      host   all      all    localhost      trust
      host   all      all    192.168.0.0/16 trust
    '';
  };
}
