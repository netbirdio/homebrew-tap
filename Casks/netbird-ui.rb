


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.70.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.0/netbird-ui_0.70.0_darwin_amd64_signed.zip"
      sha256 "6de1faef88ece20120af9bd7ff09e729a66d8a4125cc743dcf9a3bfe6c5665d9"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.70.0/netbird-ui_0.70.0_darwin_arm64_signed.zip"
      sha256 "a900802ce7a46752a7135ca8ba92ea51168bf5c43d7c3aca9df7022fa2743d13"
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
