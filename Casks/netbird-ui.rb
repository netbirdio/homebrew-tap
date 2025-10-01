


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.0/netbird-ui_0.59.0_darwin_amd64_signed.zip"
      sha256 "bf4528f898bd380cb7c2850008dbac8b7c02391623549e7779db0785e0b40b63"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.0/netbird-ui_0.59.0_darwin_arm64_signed.zip"
      sha256 "9acac9cfcd4c0b15fa6c9b2231f03359ca78f77734a83cfd867f460f2fe48d85"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight do
    set_permissions "/Applications/Netbird UI.app/installer.sh", '0755'
    set_permissions "/Applications/Netbird UI.app/uninstaller.sh", '0755'
  end

  postflight do
    system_command "#{appdir}/Netbird UI.app/installer.sh",
                   args: ["#{version}"],
                   sudo: true
  end

  uninstall_preflight do
    system_command "#{appdir}/Netbird UI.app/uninstaller.sh",
                   sudo: false
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end
