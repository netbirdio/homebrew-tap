


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.71.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.0/netbird-ui_0.71.0_darwin_amd64_signed.zip"
      sha256 "cba684a31118b6381b8218d1e0b45fd05292c20cdd6370a8519314ac3a9a8d87"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.71.0/netbird-ui_0.71.0_darwin_arm64_signed.zip"
      sha256 "cf4b91b1009c8348e96504309006cc7fc4496974d86f4b16571ceeb08e7547e5"
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
