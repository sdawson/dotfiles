{ config, lib, username, ... }:
let
  cfg = config.dotfiles.ag;
in {
  options.dotfiles.ag = {
    enable = lib.mkEnableOption "options for the silver searcher";
  };

  config = lib.mkIf cfg.enable {
    hjem.users.${username}.files.".agignore".text = ''
      vendor
    '';
  };
}
