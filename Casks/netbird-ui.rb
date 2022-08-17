


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.8.8"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.8/netbird-ui_0.8.8_darwin_amd64_signed.zip"
      sha256 "be62c08011743946f39834f5734f1ae3a976b9ec0c02a23f3f4ec49303d2c84a"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.8.8/netbird-ui_0.8.8_darwin_arm64_signed.zip"
      sha256 "17c0bc8d793e55498d55cf47c5f6cfb66ef2833eee7338e8378f880a92f6149d"
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