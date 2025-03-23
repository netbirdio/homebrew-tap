


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.39.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.39.0/netbird-ui_0.39.0_darwin_amd64_signed.zip"
      sha256 "54750b7dad14e949ea9a92dfcf5941c908a64ba3a0fed014576eee66ca8deca4"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.39.0/netbird-ui_0.39.0_darwin_arm64_signed.zip"
      sha256 "e1cb653c423f07fcece5c2d2a136a717522fcee4b8bf073a51f2402c467046c4"
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
