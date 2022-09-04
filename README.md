# Upscayl on NixOS

This repository provides a Nix flake to run Upscayl on NixOS.
The default `appimage-run` can't be used for this, because Upscayl requires Vulkan to run correctly.

The flake creates an overridden `appimage-run` that includes the necessary vulkan tools and runs the prebuilt Upscayl binary through that wrapper.

## How to use

If you are on NixOS and have flakes enabled, simply run `nix run github:mayjs/upscayl_nixos`.
You may also use this flake as an input for your system configuration and add Upscayl to your system packages that way (though there currently is no desktop file in the flake).
