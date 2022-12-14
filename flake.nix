{
  description = "Upscayl on NixOS";

  inputs = {
    upscayl.url = "https://github.com/upscayl/upscayl/releases/download/v2.0.1/upscayl-2.0.1-linux.AppImage";
    upscayl.flake = false;
  };

  outputs = { self, nixpkgs, upscayl }: {

    packages.x86_64-linux.appimage-run-vulkan = nixpkgs.legacyPackages.x86_64-linux.appimage-run.override {
      extraPkgs = pkgs: with pkgs; [ vulkan-loader ];
    };

    packages.x86_64-linux.upscayl = nixpkgs.legacyPackages.x86_64-linux.writeShellApplication {
      name = "upscayl";
      text = let appimage-run-pkg = self.packages.x86_64-linux.appimage-run-vulkan; in ''
        ${appimage-run-pkg}/bin/appimage-run ${upscayl}
      '';
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.upscayl;

  };
}
