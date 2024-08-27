


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.28.10"

  if Hardware::CPU.intel?
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.28.10/netbird-ui_0.28.10_darwin_amd64_signed.zip"
      sha256 "d0ceed960c383feb999b4511a2850aaa914a99a7a02d1eb46b1fc3d91574077e"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/mlsmaycon/netbird/releases/download/v0.28.10/netbird-ui_0.28.10_darwin_arm64_signed.zip"
      sha256 "144d9754fbe04d2597a4f6a8d40416e3e5e7d621bd81ef3db9c3c7de4ea3238d"
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