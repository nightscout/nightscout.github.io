# Nightscout on NixOS

These instructions will help you build, configure, and run Nightscout
(plus MongoDB and Nginx) on any infrastructure (bare metal, VM, VPS,
etc.) that can run NixOS.

## Table of contents

1. [Install and configure MongoDB](#install-and-configure-mongodb)
2. [Build Nightscout](#build-nightscout)
3. [Run Nightscout with Systemd](#run-nightscout-with-systemd)
4. [Configure Nginx as an entry point](#configure-nginx-as-an-entry-point)
5. [Complete NixOS configuration](#complete-nixos-configuration)

## Install and configure MongoDB

MongoDB is installed and configured via the options under
[`services.mongodb`][1].

Authentication and the root user can be set up automatically via the
`enableAuth` and `initialRootPasswordFile` options, or manually via the
`mongosh` shell command:

```
$ nix-shell -p mongosh
$ mongosh
test> use admin
admin> db.createUser(
  {
    user: "root",
    pwd: "SUPER_SECRET_PASSWORD",
    roles: [
      { role: "userAdminAnyDatabase", db: "admin" },
      { role: "dbAdminAnyDatabase", db: "admin" },
      { role: "readWriteAnyDatabase", db: "admin" }
    ]
  }
)
```

A database and user for Nightscout to use can be created automatically
via the `initialScript` option, or manually via the `mongosh` shell
command:

```
$ nix-shell -p mongosh
$ mongosh --username root --authenticationDatabase admin
test> use nightscout
nightscout> db.createUser(
  {
    user: 'nightscout',
    pwd: 'CHANGEME',
    roles:  [
      { role: 'readWrite', db: 'nightscout' }
    ]
  }
)
```

## Build Nightscout

Nightscout can be built using the [`buildNpmPackage`][2].  Here, we pass
as an argument the Node.js package to use.

*nightscout.nix:*

```nix
{ pkgs, nodejs }:
pkgs.buildNpmPackage (finalAttrs: {
  pname = "cgm-remote-monitor";
  version = "15.0.3";

  src = pkgs.fetchFromGitHub {
    owner = "nightscout";
    repo = finalAttrs.pname;
    rev = "${finalAttrs.version}";
    hash = "sha256-bI7RvEz9+7k0ZsZWuW9SrLs2qlUHhmDjOwPlLp83Jzs=";
  };

  npmDepsHash = "sha256-p3Dqj78vzRmTPMgaodGXQgvHFE0jGsmBL0p9n403Y2M=";

  nodejs = nodejs;

  npmFlags = [ "--ignore-scripts" ];

  npmBuildScript = "bundle";

  meta = {
    description = "nightscout web monitor";
    homepage = "https://github.com/nightscout/cgm-remote-monitor";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ earldouglas ];
  };
})
```

## Run Nightscout with Systemd

See `systemd.services.nightscout` block in the [complete NixOS
configuration](#complete-nixos-configuration) below.

[Read more about Systemd services][3] on the NixOS wiki.

## Configure Nginx as an entry point

See `services.nginx` block in the [complete NixOS
configuration](#complete-nixos-configuration) below.

[Read more about Nginx][4] on the NixOS wiki.

## Complete NixOS configuration

The configuration below expects the following environment variables to
be set:

* `NIGHTSCOUT_API_SECRET`
* `NIGHTSCOUT_MONGO_PASSWORD`
* `NIGHTSCOUT_PORT`
* `NIGHTSCOUT_DNS_NAME`
* `DEXCOM_PASSWORD`
* `DEXCOM_USERNAME`

This configuration assumes that we want to source our data from Dexcom
Share.  For alternatives, see the [`connect`][5] section of the docs.

This configuration also assumes that we want to run an Nginx reverse
proxy in front of our Nightscout instance.  This can be useful for
observability, rate limiting, HTTPS support, etc.

*configuration.nix:*

```nix
{ pkgs, lib, ... }:

let

  dexcomPassword          = builtins.getEnv "DEXCOM_PASSWORD";
  dexcomUsername          = builtins.getEnv "DEXCOM_USERNAME";

  nightscoutApiSecret     = builtins.getEnv "NIGHTSCOUT_API_SECRET";
  nightscoutMongoPassword = builtins.getEnv "NIGHTSCOUT_MONGO_PASSWORD";
  nightscoutPort          = builtins.parseInt(builtins.getEnv "NIGHTSCOUT_PORT");

  dnsName                 = builtins.getEnv "NIGHTSCOUT_DNS_NAME";

  # Use a supported version of Node.js
  nodejs = pkgs.nodejs_20;

  mongodb =
    (import <nixpkgs> {
      config.permittedInsecurePackages = [];
      config.allowUnfreePredicate =
        pkg: builtins.elem (pkgs.lib.getName pkg) [ "mongodb-ce" ];
    }).mongodb-ce;

  nightscout =
    import ./nightscout.nix {
      inherit pkgs;
      inherit nodejs;
    };

in {

  ## MongoDB ###########################################################

  services.mongodb = {
    enable = true;
    package = mongodb;
    extraConfig = ''
      security.authorization: enabled
    '';
  };

  ## Nightscout service account ########################################

  users.groups.nightscout = {};
  users.users.nightscout = {
    group = "nightscout";
    isSystemUser = true;
  };

  ## Nightscout service ################################################

  systemd.services.nightscout = {
    description = "nightscout";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      WorkingDirectory = "${nightscout}/lib/node_modules/nightscout";
      ExecStart = "${nodejs}/bin/node lib/server/server.js";
      User = "nightscout";
      Restart = "always";
    };
    environment = {

      ## Required ######################################################
      # See https://github.com/nightscout/cgm-remote-monitor?tab=readme-ov-file#required

      MONGODB_URI = "mongodb://nightscout:${nightscoutMongoPassword}@localhost:27017/nightscout";
      API_SECRET = nightscoutApiSecret;
      MONGODB_COLLECTION = "entries";
      DISPLAY_UNITS = "mg/dl";

      ## Features ######################################################
      # See https://github.com/nightscout/cgm-remote-monitor?tab=readme-ov-file#features

      ENABLE =
        lib.strings.concatStrings (
          lib.intersperse " " [
            "connect"
            "ar2"
            "basal"
            "boluscalc"
            "careportal"
            "delta"
            "devicestatus"
            "direction"
            "errorcodes"
            "food"
            "profile"
            "simplealarms"
            "speech"
            "timeago"
          ]
        );
      AUTH_DEFAULT_ROLES = "denied";

      BASE_URL = "https://nightscout.earldouglas.com";

      ## Core ##########################################################
      # See https://github.com/nightscout/cgm-remote-monitor?tab=readme-ov-file#core

      PORT = toString nightscoutPort;

      # See https://github.com/nightscout/cgm-remote-monitor?tab=readme-ov-file#predefined-values-for-your-server-settings-optional

      TIME_FORMAT = "24";
      INSECURE_USE_HTTP = "true";
      THEME = "colors";

      ## Dexcom Share ##################################################
      # See https://github.com/nightscout/cgm-remote-monitor?tab=readme-ov-file#connect-nightscout-connect

      CONNECT_SOURCE = "dexcomshare";
      CONNECT_SHARE_ACCOUNT_NAME = dexcomUsername;
      CONNECT_SHARE_PASSWORD = dexcomPassword;

      ## Plugins #######################################################
      # See https://github.com/nightscout/cgm-remote-monitor?tab=readme-ov-file#plugins

      AR2_CONE_FACTOR = "0";
    };
  };

  ## Nginx entry point and reverse proxy ###############################

  services.nginx = {
    enable = true;
    virtualHosts."${dnsName}" = {
      locations."/".extraConfig = ''
        proxy_pass http://localhost:${toString nightscoutPort};
      '';
    };
  };
}
```

[1]: https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=alpha_asc&type=packages&query=services.mongodb
[2]: https://nixos.org/manual/nixpkgs/unstable/#javascript-buildNpmPackage
[3]: https://wiki.nixos.org/wiki/Systemd/User_Services
[4]: https://wiki.nixos.org/wiki/Nginx
[5]: https://github.com/nightscout/cgm-remote-monitor?tab=readme-ov-file#connect-nightscout-connect
