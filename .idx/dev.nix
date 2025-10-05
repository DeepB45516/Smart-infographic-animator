{ pkgs, ... }:

{
  # Use the unstable channel for latest packages
  channel = "unstable";

  # Add required packages
  packages = [
    pkgs.nodejs_20
    pkgs.firebase-tools
  ];

  # Environment variables (optional)
  env = {
  };

  # Enable IDX preview for Firebase Hosting
  idx.previews = {
    enable = true;
    previews = {
      web = {
        # Use Firebase CLI preview instead of npm dev
        command = [
          "firebase"
          "emulators:start"
          "--only"
          "hosting"
          "--port"
          "$PORT"
        ];
        manager = "web";
      };
    };
  };
}