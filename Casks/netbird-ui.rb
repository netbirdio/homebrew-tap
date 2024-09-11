


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.29.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.1/netbird-ui_0.29.1_darwin_amd64_signed.zip"
      sha256 "89fd15a4e00082fd62182fa5caeea5899667e6ce9813accab18e7fed078ab860"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.1/netbird-ui_0.29.1_darwin_arm64_signed.zip"
      sha256 "a854bccc4295ae48274b2a3c802dd966ffc729a12ab065de95e5c911b619f393"
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