{lib, pkgs, config, ...}:

with lib;
let
  inherit (lib) mkOption mkIf;
  cfg = config.services.xserver.windowManager.openbox;
in

{
  options = {
    services.xserver.windowManager.openbox.enable = mkEnableOption "oroborus";
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager = {
      session = [{
        name = "openbox";
        start = "
          ${pkgs.openbox}/bin/openbox-session
        ";
      }];
    };
    environment.systemPackages = [ pkgs.openbox ];
  };
}
