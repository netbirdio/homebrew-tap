


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.36.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.3/netbird-ui_0.36.3_darwin_amd64_signed.zip"
      sha256 "03c1f289b0ba0a2304bee9cc1eae27d9e293b4cf5489866ddcb87ec128fe1153"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.3/netbird-ui_0.36.3_darwin_arm64_signed.zip"
      sha256 "ce4a518c8ee363018d73758900271bd34b616023e000e9274d78072e33ef77eb"
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
