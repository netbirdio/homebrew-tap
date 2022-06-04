


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.6.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.3/netbird-ui_0.6.3_darwin_amd64_signed.zip"
      sha256 "d27df5945f2ee262c94f1f9bbd0f6edf3bc1533a7b7b7097d981a4a45068f07a"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.6.3/netbird-ui_0.6.3_darwin_arm64_signed.zip"
      sha256 "3a6f36652a5d335599cdf197c690e345e05cd1a6ab9484b22543e107805c7c19"
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