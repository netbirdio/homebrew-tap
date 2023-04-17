


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.16.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.16.0/netbird-ui_0.16.0_darwin_amd64_signed.zip"
      sha256 "6a5002089ca1efeb29d745762c6e8c8eafe8d4f50fd1487b10645f0faa0ad1ee"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.16.0/netbird-ui_0.16.0_darwin_arm64_signed.zip"
      sha256 "9a27a5b0d0733eaae57f1d095b6feb2a894652fe969844b57f5420c65a398d07"
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