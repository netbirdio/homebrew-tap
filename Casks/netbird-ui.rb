


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.43.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.43.1/netbird-ui_0.43.1_darwin_amd64_signed.zip"
      sha256 "5909e9106ffe78f948367d3b3423f0337f93b63cef8247294758da6127f27ed7"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.43.1/netbird-ui_0.43.1_darwin_arm64_signed.zip"
      sha256 "8c2d732899bdbe8cd6ac0f6708f108f20a01a260771293f61c6f00332bc94e19"
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
