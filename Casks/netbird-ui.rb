


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.14.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.4/netbird-ui_0.14.4_darwin_amd64_signed.zip"
      sha256 "3287c768eb460d9818e29d1b9572e5afff095af7a77205e13dc06444501735ee"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.4/netbird-ui_0.14.4_darwin_arm64_signed.zip"
      sha256 "69c14dc3e5eed0cf1bc76acab8ffc936774c7ea41c5803706530d087a80ba551"
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