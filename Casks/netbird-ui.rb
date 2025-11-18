


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.60.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.0/netbird-ui_0.60.0_darwin_amd64_signed.zip"
      sha256 "56e769a6c3f53888a8925bcaf1cf74f5369cd80aa5fb54ae9320746951c1716b"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.60.0/netbird-ui_0.60.0_darwin_arm64_signed.zip"
      sha256 "25eea5042a6708f8bc0f3113dedb1dc1e69f56905a93db85c63e5a95c47bd5b2"
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
