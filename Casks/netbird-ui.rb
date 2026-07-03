


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.74.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.2/netbird-ui_0.74.2_darwin_amd64_signed.zip"
      sha256 "94d70efb9208af0efe73db3c7e96c776554143d3b9898e13cc30986bec3bebad"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.74.2/netbird-ui_0.74.2_darwin_arm64_signed.zip"
      sha256 "d0adf0d473c6083e6fca912599ae4d4b9e5e8f12761966e9601acb93f26ba732"
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
