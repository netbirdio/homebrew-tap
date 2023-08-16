


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.22.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.5/netbird-ui_0.22.5_darwin_amd64_signed.zip"
      sha256 "a93e7f3840066b2d91b787b66711d00bdd99c6e4352dde012b94bff86b70d73e"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.5/netbird-ui_0.22.5_darwin_arm64_signed.zip"
      sha256 "22734dc0fb58504aa2cd0135571ef84ceddd4bd55eeeb5de1d8dcace5a4a8d86"
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