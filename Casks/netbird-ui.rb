


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.8/netbird-ui_0.60.8_darwin_amd64_signed.zip"
      sha256 "179bb570391cf45b82a9aedf2c5b330a8d0c457853e760ce7184016890c992cc"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.8/netbird-ui_0.60.8_darwin_arm64_signed.zip"
      sha256 "0fe2e34ec3edb767c8253af2685cd9cdbed4fc07555bd3be3848b71a8956b95f"
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
