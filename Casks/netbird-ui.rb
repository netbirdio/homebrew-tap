


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.2/netbird-ui_0.59.2_darwin_amd64_signed.zip"
      sha256 "4795e43fbe6c4ba590d6937e974b48950ec2f247ca477ba69f23c8acf0422f2f"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.2/netbird-ui_0.59.2_darwin_arm64_signed.zip"
      sha256 "b86a9b376d49f48cdc3ba98e211b5164dc6b886315633467a7f26d402bad3140"
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
