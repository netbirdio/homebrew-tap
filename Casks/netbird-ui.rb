


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.8/netbird-ui_0.27.8_darwin_amd64_signed.zip"
      sha256 "2b65023e7c7d270cd57ce0334a12e8d6a3fc39451e2080561893bf98f07c2ffa"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.8/netbird-ui_0.27.8_darwin_arm64_signed.zip"
      sha256 "afbc886d31e375ebc639916fa6355aa8f5947f15ea27600d368e6827c733d4b9"
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