


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.64.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.6/netbird-ui_0.64.6_darwin_amd64_signed.zip"
      sha256 "23555eeacbc2f5c128e85224af53c1250198ee4ad214e95ec5f15550b0b15313"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.64.6/netbird-ui_0.64.6_darwin_arm64_signed.zip"
      sha256 "7a8c248eba72f509368e840e337f186bbfbbc328332c8513ce0fbd72c2265d58"
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
