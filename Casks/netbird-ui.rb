


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.9"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.9/netbird-ui_0.28.9_darwin_amd64_signed.zip"
      sha256 "f20e856b4f7b23e3488c6068d2a15fab9863b80709531bf3ed0c34bc95bf7369"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.9/netbird-ui_0.28.9_darwin_arm64_signed.zip"
      sha256 "da26cde366ad0fb378fcf3209b30ed267f0eacd8694f99e227df125955cc2e41"
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