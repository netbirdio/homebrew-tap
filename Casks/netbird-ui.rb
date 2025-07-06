


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.50.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.50.1/netbird-ui_0.50.1_darwin_amd64_signed.zip"
      sha256 "cb89d92c1252099ef42a5a5295e7f9d989f839fb39874574fab47533873b8dd1"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.50.1/netbird-ui_0.50.1_darwin_arm64_signed.zip"
      sha256 "a19f83aa73e2f60b8f646466a8975f29479a1c795ad736a1d03b27afaf5fa2f5"
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
