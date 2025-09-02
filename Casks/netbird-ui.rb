


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.56.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.56.0/netbird-ui_0.56.0_darwin_amd64_signed.zip"
      sha256 "890ae81561285e4cbc7fe871380bc248cbb131651e1f22497e3f4f47a5fc5029"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.56.0/netbird-ui_0.56.0_darwin_arm64_signed.zip"
      sha256 "5c296970da90dd030fd4f414035c24fcea0f74bfe056438bbfb70087ff83e8d0"
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
