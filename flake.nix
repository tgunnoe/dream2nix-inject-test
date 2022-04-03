  {
    inputs.dream2nix.url = "github:nix-community/dream2nix";
    outputs = { self, dream2nix }@inputs:
      let
        dream2nix = inputs.dream2nix.lib.init {
          systems = [ "x86_64-linux" ];
          config.projectRoot = ./. ;
        };
      in dream2nix.makeFlakeOutputs {
        source = ./.;
        inject = {
          express-prom-bundle."6.4.1" = [
            ["prom-client" "13.1.0"]
          ];
        };
      };
  }
