


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.9.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.2/netbird-ui_0.9.2_darwin_amd64_signed.zip"
      sha256 "d3a7c4aae2aef08a7053905ad1314a3182251993f17d52e60ab0c0db3ee6f88b"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.2/netbird-ui_0.9.2_darwin_arm64_signed.zip"
      sha256 "50cbd47054491eeed8d125819f063e8905da863177ba5b39418d861e67562c7d"
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