


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.22.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.2/netbird-ui_0.22.2_darwin_amd64_signed.zip"
      sha256 "90e9668ce62d1fd9f6849a919aa97f928c394a9e828b3447f09f7bcac8917459"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.2/netbird-ui_0.22.2_darwin_arm64_signed.zip"
      sha256 "2290acd8f48be47b884565b65ebaf3cafbe64c560388837be893c9dab976eec0"
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