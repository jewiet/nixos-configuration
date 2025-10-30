{ config, lib, pkgs, inputs, ... }:
let
  form-to-mail = inputs.form-to-mail.packages.${pkgs.system}.default;
in
{
  users.users.form-to-mail = {
    isSystemUser = true;
    group = "form-to-mail";
    createHome = true;
    home = "/var/form-to-mail";
    description = "A system user to run the Form to Mail service";
  };
  
  users.groups.form-to-mail = {};

  systemd.services.form-to-mail = {
    script = "${form-to-mail}/bin/form-to-mail";
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      User = "form-to-mail";
    };
  };
  networking.firewall.allowedTCPPorts = [8080];
}
