{ config, lib, pkgs, ... }:

{
  systemd.services.form-to-mail = {
    script = "${pkgs.temurin-jre-bin}/bin/java -jar ~jewiet/form-to-mail-0.1.25-standalone.jar";
    wantedBy = ["multi-user.target"];
  };
  networking.firewall.allowedTCPPorts = [8080];
}
