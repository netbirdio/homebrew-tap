


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.26.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.0/netbird-ui_0.26.0_darwin_amd64_signed.zip"
      sha256 "77e22abceeea59652d45cd0a5061150ee915bac654aa9fb43775dc21542ff84f"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.0/netbird-ui_0.26.0_darwin_arm64_signed.zip"
      sha256 "eade741a32c5b5690afa47fbb6704ff1e819a04a37cbc3ecd4cf2898426cbf53"
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