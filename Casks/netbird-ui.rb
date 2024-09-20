


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.29.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.4/netbird-ui_0.29.4_darwin_amd64_signed.zip"
      sha256 "5b3b93be3862db906872014db37a3ad28d6366eba345451a8d7b4260761bc388"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.4/netbird-ui_0.29.4_darwin_arm64_signed.zip"
      sha256 "55fd1476daf242c45997da55c6a95bc3adbd8a5c20cd1a8dcd8d3d41a6eb55d9"
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