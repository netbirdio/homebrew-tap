


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.74.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.7/netbird-ui_0.74.7_darwin_amd64_signed.zip"
      sha256 "bdc044d55e5aee6ff8b7bf7d4a87ca953385a5895be683940a0aa39d59ca2dc5"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.7/netbird-ui_0.74.7_darwin_arm64_signed.zip"
      sha256 "989bec473806242cf1da0cb81677fa299f8a5fc377c979b60f0df219f7162350"
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
