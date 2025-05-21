


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.45.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.45.1/netbird-ui_0.45.1_darwin_amd64_signed.zip"
      sha256 "855faf2a65cf1a2774a8c2980023ab7b26ea3e99f198aadcaaea06527828ddcd"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.45.1/netbird-ui_0.45.1_darwin_arm64_signed.zip"
      sha256 "96a61772cdc55f18e564442739ae7c5ad42f2ec8b2f9a32e1ca4fe303e8403f2"
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
