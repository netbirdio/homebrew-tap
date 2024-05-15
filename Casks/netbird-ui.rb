


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.7"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.7/netbird-ui_0.27.7_darwin_amd64_signed.zip"
      sha256 "966ef062f7d9f34e595791dfa83316518c1a14922385effc67b618b2abad73b0"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.7/netbird-ui_0.27.7_darwin_arm64_signed.zip"
      sha256 "c3f18872277340f3bce8d0375d3f6821dfa2919716706b400a638316bf34399b"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
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