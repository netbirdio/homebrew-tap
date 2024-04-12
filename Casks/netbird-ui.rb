


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.3/netbird-ui_0.27.3_darwin_amd64_signed.zip"
      sha256 "506e819dd468b02433d46801d9a18ce238a973e0d37ebe4217dcfaa27005d978"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.3/netbird-ui_0.27.3_darwin_arm64_signed.zip"
      sha256 "34f268ecf26159789860bf80667d713a264c48d664120cb225b6c8d5db427aaa"
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