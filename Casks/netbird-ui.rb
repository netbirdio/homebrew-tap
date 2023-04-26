


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.17.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.17.0/netbird-ui_0.17.0_darwin_amd64_signed.zip"
      sha256 "b0d0a2c2f2bf3862a92438a8186f0a85069c51bf193dd2762fcd51cf526e4ae4"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.17.0/netbird-ui_0.17.0_darwin_arm64_signed.zip"
      sha256 "c115be1d30bdba0c28b3b6214fbbca523157f972e29cf4989617c96cdbd28349"
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