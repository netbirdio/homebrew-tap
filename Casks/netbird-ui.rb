


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.5"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.5/netbird-ui_0.11.5_darwin_amd64_signed.zip"
      sha256 "b722a9b12d0691221006770bdd94612771bb3a825d519a1a893b3b8a5d3c9ef4"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.5/netbird-ui_0.11.5_darwin_arm64_signed.zip"
      sha256 "43fba954f4832d82d95e47a78418576823d78334055ea6f7938b940275f6abc6"
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