{
  description = ''Useful synchronization primitives.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-sync-v1_5_0.flake = false;
  inputs.src-sync-v1_5_0.owner = "planetis-m";
  inputs.src-sync-v1_5_0.ref   = "v1_5_0";
  inputs.src-sync-v1_5_0.repo  = "sync";
  inputs.src-sync-v1_5_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-sync-v1_5_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-sync-v1_5_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}