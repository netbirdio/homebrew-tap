


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.11.1"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.1/netbird-ui_0.11.1_darwin_amd64_signed.zip"
      sha256 "8b4dac7f87215f82e90081cbe6eb08003220441ccfbfd9fe631e5cd47cfbb5df"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.11.1/netbird-ui_0.11.1_darwin_arm64_signed.zip"
      sha256 "d07344fcabc055e5eff31b08a6c33ebedcbd9ff00df20ce0408eca4d116537e5"
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