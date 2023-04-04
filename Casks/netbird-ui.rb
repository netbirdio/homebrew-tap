


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.15.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.15.0/netbird-ui_0.15.0_darwin_amd64_signed.zip"
      sha256 "6a38f215e05309434f4bdd4fa1e682686bbd4db7b5cce231c8dcac5bd31816d4"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.15.0/netbird-ui_0.15.0_darwin_arm64_signed.zip"
      sha256 "cf74f64dc4e9b9ff3b13eb3445604145a6dcccacfb5ad97fc838b2ea3095aee2"
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