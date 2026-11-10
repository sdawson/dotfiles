{
  description = "A flake for my dotfiles";

  inputs = {
    lib.url = "github:nix-community/nixpkgs.lib";
  };

  outputs = {
    self,
    lib,
    ...
  } @ inputs:
  let
  in {
    homeModules.default = { lib, pkgs, username, ... }: {
      imports = [
        ./tester/tester.nix
        ./ag/ag.nix
      ];
      # add some imports for project specific files here.
      # hjem stuff goes here
    };
  };
}
