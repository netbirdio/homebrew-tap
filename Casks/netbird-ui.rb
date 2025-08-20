


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.55.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.55.0/netbird-ui_0.55.0_darwin_amd64_signed.zip"
      sha256 "a9d74c637106c4c0c5f6ae101f12b15e933c1c853507d8e919e5db6de612ca41"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.55.0/netbird-ui_0.55.0_darwin_arm64_signed.zip"
      sha256 "b5e8b447c73ed9479aa4ae3692e7241f6bf5b8e2270bcedf99b59a69660e527c"
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
