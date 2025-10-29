{ config, lib, pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [
    8080
  ];
}
