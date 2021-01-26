let
  pkgs = import <nixpkgs> {};
  inherit (pkgs) lib;
  kframework = import ../k {};
  kore-project = import ../kore { release = true; };
  inherit (kore-project) kore;
in
  pkgs.mkShell {
    K_RELEASE = kframework.k;
    buildInputs = with pkgs; [
      bison gnumake z3 kframework.k kore
    ];
  }
