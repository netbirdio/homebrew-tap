


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.38.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.38.2/netbird-ui_0.38.2_darwin_amd64_signed.zip"
      sha256 "cdb70713796558d49db71641bbd6c816c447665e88023cb7e8e059edb931959a"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.38.2/netbird-ui_0.38.2_darwin_arm64_signed.zip"
      sha256 "fb622659820ed7955a4592519bb8ba3f2cc2d1f21e59a2d06611fae6620cafc4"
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
