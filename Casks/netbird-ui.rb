


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.10.10"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.10/netbird-ui_0.10.10_darwin_amd64_signed.zip"
      sha256 "c859277b9bfd83fb17d3861d38d0f0ab7e1608b8b9d8910fb9beb6504b526e44"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.10.10/netbird-ui_0.10.10_darwin_arm64_signed.zip"
      sha256 "8340060e633542d70a38d0c8d16beac248c9614bf0851b27e7d720dc351cce7f"
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