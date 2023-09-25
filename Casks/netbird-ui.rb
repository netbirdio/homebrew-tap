


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.23.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.4/netbird-ui_0.23.4_darwin_amd64_signed.zip"
      sha256 "348e7422452711ec84455fb2b9eba23f2087b39a449a9f15528acd342b31542d"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.23.4/netbird-ui_0.23.4_darwin_arm64_signed.zip"
      sha256 "c216d1350ab2e95e91d0f84dcf392173217e708db8772b45e5cdc919edf0ed48"
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