{
  nix.enabled = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "ivolej01";
  system.stateVersion = 6;
}