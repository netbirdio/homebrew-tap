


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.30.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.30.1/netbird-ui_0.30.1_darwin_amd64_signed.zip"
      sha256 "41e60be59f1be98b5ef36a180f70cc0e73a88435b1cfebda0994931f5bf2a606"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.30.1/netbird-ui_0.30.1_darwin_arm64_signed.zip"
      sha256 "b82606679a8fbf5cb593139e888de9ac5827d4eb517872bb63ff0a45ad2182d0"
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