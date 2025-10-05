{ pkgs, ... }:

{
  # Which nixpkgs channel to use
  channel = "unstable";

  # Include necessary packages
  packages = [
    pkgs.nodejs_21
    pkgs.firebase-tools
  ];

  # Set environment variables (optional)
  env = {
    FIREBASE_EMULATOR_PORT = "5000";
  };

  # Enable IDX previews and configure Firebase preview
  idx.previews = {
    enable = true;
    previews = {
      firebase = {
        command = [
          "firebase"
          "emulators:start"
          "--only"
          "hosting"
          "--host"
          "0.0.0.0"
          "--port"
          "$PORT"
        ];
        manager = "web";
      };
    };
  };
}
