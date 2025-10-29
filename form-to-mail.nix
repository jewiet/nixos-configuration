{ config, lib, pkgs, ... }:

{
  users.users.form-to-mail = {
    isSystemUser = true;
    group = "form-to-mail";
    description = "A system user to run the Form to Mail service";
  };
  
  users.groups.form-to-mail = {};

  systemd.services.form-to-mail = {
    script = "${pkgs.temurin-jre-bin}/bin/java -jar ~jewiet/form-to-mail-0.1.25-standalone.jar";
    wantedBy = ["multi-user.target"];
  };
  networking.firewall.allowedTCPPorts = [8080];
}
