let
  pkgs = import <nixpkgs> {};
  k = (import ../nixpkgs-kframework/release.nix).kframework.k;
  kore = (import ../kore { release = true; }).project.kore.components.all;
in
  pkgs.mkShell {
    K_RELEASE = k;
    buildInputs = with pkgs; [
      gnumake graphviz z3
      k kore
    ];
  }
