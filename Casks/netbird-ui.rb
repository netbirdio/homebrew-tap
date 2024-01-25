


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.5/netbird-ui_0.25.5_darwin_amd64_signed.zip"
      sha256 "aca2a3e53597a2b49569c12995d19664892094d56816816ebec0e5146d600486"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.5/netbird-ui_0.25.5_darwin_arm64_signed.zip"
      sha256 "80b8f3481ae0e521e6956e778e57a4ae4cd416df3cf87a1ec4bf1b8865b96925"
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