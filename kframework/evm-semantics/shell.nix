let
  pkgs = import <nixpkgs> {};
  inherit (import ../k {}) k;
  inherit (import ../kore { release = true; /* profiling = true; */ }) kore;
in
  pkgs.mkShell {
    K_RELEASE = k;
    buildInputs = with pkgs; [
      gnumake graphviz z3 k kore
    ];
  }
