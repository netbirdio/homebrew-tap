


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.24.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.0/netbird-ui_0.24.0_darwin_amd64_signed.zip"
      sha256 "a396adcef52c7e2b4d5b955e762b09a2b840f9b91cad843d7b580c3e5e572130"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.0/netbird-ui_0.24.0_darwin_arm64_signed.zip"
      sha256 "cd291ca93e959ac37ffe777e0f4560253a97cc60b661cf68461c622fe13092df"
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