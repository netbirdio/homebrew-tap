


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.42.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.42.0/netbird-ui_0.42.0_darwin_amd64_signed.zip"
      sha256 "7d476c6279ab838178330577c955257ff0aad745b0f6f17bea00939325dc2068"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.42.0/netbird-ui_0.42.0_darwin_arm64_signed.zip"
      sha256 "87279d376f39b91c98db3057565801c086ec71a50f2ca38121c58e81baef7cf7"
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
