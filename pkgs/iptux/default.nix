{ stdenv
, lib
, fetchFromGitHub
, cmake
, pkg-config
, wrapGAppsHook
, elfutils
, fribidi
, gstreamer
, gtest
, gtk
, jsoncpp
, libXdmcp
, libpthreadstubs
, libselinux
, libsepol
, libunwind
, libuuid
, pcre
}:
stdenv.mkDerivation rec {
  pname = "iptux";
  version = "0.7.6";

  src = fetchFromGitHub {
    owner = "iptux-src";
    repo = "iptux";
    rev = "v${version}";
    sha256 = "0fb3w968xxj39fazf8dcda6bgi9pbd6i4pichr6hgydwsi456k3d";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    wrapGAppsHook
  ];
  buildInputs = [
    elfutils
    fribidi
    gstreamer
    gtest
    gtk
    jsoncpp
    libXdmcp
    libpthreadstubs
    libselinux
    libsepol
    libunwind
    libuuid
    pcre
  ];

  meta = with lib; {
    description = "Gnome disk utility fixed icons for KDE";
    homepage = "https://wiki.gnome.org/Apps/DiskUsageAnalyzer";
    license = licenses.gpl2;
    maintainers = [ "Scott Hamilton <sgn.hamilton+nixpkgs@protonmail.com>" ];
    platforms = platforms.linux;
  };
}
