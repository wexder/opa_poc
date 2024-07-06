{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/c3a0b828e978e3a10bd135717a741c8907ec7a5c";
    devenv.url = "github:cachix/devenv/v0.6.3";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = { self, nixpkgs, devenv, ... } @ inputs:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      # opa = pkgs.callPackage ./opa.nix { };
    in
    {
      devShell.x86_64-linux = devenv.lib.mkShell {
        inherit inputs pkgs;

        modules = [
          ({ pkgs, lib, ... }: {

            # This is your devenv configuration
            packages = [
              pkgs.buf
              pkgs.gopls
              pkgs.go_1_22
              pkgs.gotests
              pkgs.gosec
              pkgs.golangci-lint
              pkgs.open-policy-agent
              pkgs.regols
            ];

            enterShell = ''
            '';
          })
        ];
      };
    };
}
