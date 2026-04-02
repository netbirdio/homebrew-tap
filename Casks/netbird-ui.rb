


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.67.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.67.3/netbird-ui_0.67.3_darwin_amd64_signed.zip"
      sha256 "8dcf7444d7dae1fe1203a5bba0521e71923ef60e4f608c9cb772d836f381646e"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.67.3/netbird-ui_0.67.3_darwin_arm64_signed.zip"
      sha256 "2a3cb84768c6035b0fabfefbc3606fb0e34fa404c595f2d936918cba39c27f17"
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
