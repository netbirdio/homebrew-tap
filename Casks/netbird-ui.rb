


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.59.13"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.13/netbird-ui_0.59.13_darwin_amd64_signed.zip"
      sha256 "01743c5a3a81df35b094f1850dd131ec482760e25ecc4ec6bd077902b5461978"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.59.13/netbird-ui_0.59.13_darwin_arm64_signed.zip"
      sha256 "2f3e579e3832dd79b21490bf67939da2776bdd268887d703dc54042d650f9ab4"
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
