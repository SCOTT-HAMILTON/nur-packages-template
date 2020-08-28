# This file describes your repository contents.  It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> {} 
}:

rec {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays
  
  anystyle-cli = pkgs.callPackage ./pkgs/anystyle-cli { };
  argparse = pkgs.callPackage ./pkgs/argparse { };
  baobab = pkgs.callPackage ./pkgs/baobab { };
  bomber = pkgs.kdeApplications.callPackage ./pkgs/Bomber { };
  cargo-sort-ck = with pkgs.rustPlatform; pkgs.callPackage ./pkgs/cargo-sort-ck {
    inherit buildRustPackage;
  };
  compton = pkgs.callPackage ./pkgs/Compton { };
  controls-for-fake = pkgs.libsForQt5.callPackage ./pkgs/ControlsForFake  {
    inherit libfake;
    FakeMicWavPlayer = fake-mic-wav-player;
  };
  day-night-plasma-wallpapers = with pkgs.python3Packages; pkgs.callPackage ./pkgs/day-night-plasma-wallpapers { 
    dbus-python = dbus-python;
  };
  fake-mic-wav-player = pkgs.libsForQt5.callPackage ./pkgs/FakeMicWavPlayer {
    inherit libfake argparse;
  };
  haste-client = pkgs.callPackage ./pkgs/haste-client { };
  inkscape = pkgs.callPackage ./pkgs/inkscape-1.0 { 
    lcms = pkgs.lcms2;
  };
  juk = pkgs.kdeApplications.callPackage ./pkgs/Juk { };
  kapptemplate = pkgs.kdeApplications.callPackage ./pkgs/KAppTemplate { };
  kbreakout = pkgs.kdeApplications.callPackage ./pkgs/KBreakOut { };
  keysmith = pkgs.kdeApplications.callPackage ./pkgs/keysmith { };
  killbots = pkgs.kdeApplications.callPackage ./pkgs/Killbots { };
  kirigami-gallery = pkgs.kdeApplications.callPackage ./pkgs/KirigamiGallery { };
  ksmoothdock = pkgs.libsForQt5.callPackage ./pkgs/ksmoothdock { };
  libfake = pkgs.callPackage ./pkgs/FakeLib { };
  lokalize = pkgs.libsForQt5.callPackage ./pkgs/Lokalize { };
  merge-keepass = with pkgs.python3Packages; pkgs.callPackage ./pkgs/merge-keepass { 
    inherit buildPythonPackage pykeepass click pytest;
  };
  ncgopher = pkgs.callPackage ./pkgs/ncgopher { };
  parallel-ssh = with pkgs.python3Packages; pkgs.callPackage ./pkgs/parallel-ssh {
    inherit buildPythonPackage setuptools fetchPypi paramiko gevent ssh2-python;
  };
  python-iconf = with pkgs.python3Packages; pkgs.callPackage ./pkgs/python-iconf {
    inherit buildPythonPackage fetchPypi pytest;
  };
  qtile = pkgs.callPackage ./pkgs/qtile { };
  rofi = pkgs.callPackage ./pkgs/rofi { };
  semantik = pkgs.libsForQt5.callPackage ./pkgs/semantik { };
  scripts = with pkgs.python3Packages; pkgs.callPackage ./pkgs/Scripts {
    eom = pkgs.mate.eom;
    inherit sync-database buildPythonPackage parallel-ssh merge-keepass;
  };
  slick-greeter = with pkgs.gnome3; pkgs.callPackage ./pkgs/slick-greeter {
    inherit gnome-common gtk slick-greeter;
  };
  spectacle-clipboard = pkgs.libsForQt5.callPackage ./pkgs/spectacle-clipboard { };
  ssh2-python = with pkgs.python3Packages; pkgs.callPackage ./pkgs/ssh2-python {
    inherit buildPythonPackage fetchPypi cython setuptools pytest;
  };
  super-tux-kart = pkgs.callPackage ./pkgs/SuperTuxKart {
    inherit wiiuse;
  };
  sync-database = with pkgs.python3Packages; pkgs.callPackage ./pkgs/sync-database {
    inherit buildPythonPackage parallel-ssh merge-keepass pykeepass;
  };
  vokoscreen-ng = with pkgs; libsForQt5.callPackage ./pkgs/vokoscreenNG {
    gstreamer = gst_all_1.gstreamer;
    gst-plugins-base = gst_all_1.gst-plugins-base;
    gst-plugins-good = gst_all_1.gst-plugins-good;
    gst-plugins-bad = gst_all_1.gst-plugins-bad;
    gst-plugins-ugly = gst_all_1.gst-plugins-ugly;
  };
  wiiuse = pkgs.callPackage ./pkgs/WiiUse { };

}

