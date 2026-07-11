


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.74.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.4/netbird-ui_0.74.4_darwin_amd64_signed.zip"
      sha256 "ba4477ab266494822600244d0de8c6bf3dd0cb67c8918c9c17ac64b59c7178f4"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.4/netbird-ui_0.74.4_darwin_arm64_signed.zip"
      sha256 "d849f57db3da0d541e194342df847bacd3b86347ea2c0b1cfb73163315fe6930"
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
