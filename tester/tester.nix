{ config, lib, username, ... }:
let
  cfg = config.dotfiles.tester;
in {
  options.dotfiles.tester = {
    enable = lib.mkEnableOption "a test option for testing a separate dotfiles flake";
  };

  config = lib.mkIf cfg.enable {
    hjem.users.${username}.files = {
      ".config/tester".text = "blah1";
    };
  };
}
