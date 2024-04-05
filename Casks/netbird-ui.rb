


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.1/netbird-ui_0.27.1_darwin_amd64_signed.zip"
      sha256 "1f0c9c908a643dbeadee484bad04c8457cdfc78acd1ff4246c9fac9ef115009c"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.1/netbird-ui_0.27.1_darwin_arm64_signed.zip"
      sha256 "da4158b31d2b86e8663c70a1cd67c210b90aaad71736e16cd6995f3814b8d7ca"
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