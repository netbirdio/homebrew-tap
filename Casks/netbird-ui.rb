


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.2/netbird-ui_0.8.2_darwin_amd64_signed.zip"
      sha256 "1b3dcfe596e379f07a78ee11bf9dbdeccb97e8813b565643144f53f1877ba120"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.2/netbird-ui_0.8.2_darwin_arm64_signed.zip"
      sha256 "715d9bf6932083d2ad362d986d40848a3c3b59dca395760c9a63a1ed6a80c0f0"
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