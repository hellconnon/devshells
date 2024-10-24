{
  description = "A flake used for the climate machine learning course at KIT";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-stable.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = {
    self,
    nixpkgs,
    nix-stable,
  }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
      stablePkgs = import nix-stable {
        inherit system;
      };
    in
      pkgs.mkShell {
        packages = with pkgs; [
          python3
          python312Packages.numpy
          python312Packages.pandas
          python312Packages.matplotlib
          python312Packages.netcdf4
          python312Packages.xarray
          python312Packages.scikit-learn
          python312Packages.jupyter
          stablePkgs.python312Packages.cartopy
        ];
        shellHook = ''
          exec zsh
        '';
      };
  };
}
