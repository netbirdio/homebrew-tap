


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.14.6"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.6/netbird-ui_0.14.6_darwin_amd64_signed.zip"
      sha256 "73e945ae360fc45a37a5ddcb0b7868b04f4bc51a5d886b348c2878afbbed8e07"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.14.6/netbird-ui_0.14.6_darwin_arm64_signed.zip"
      sha256 "a94484f8ce335f11fade2c59eccf33d97ec49f183cfce397e94e3e2eab84e7a2"
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