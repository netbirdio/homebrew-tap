


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.75.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.75.0/netbird-ui_0.75.0_darwin_amd64_signed.zip"
      sha256 "6de90e8bcdf68d92ed30b3f3e0b4f0f6c85dc8607902c0b9a8c1d9f5a1d98b0f"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.75.0/netbird-ui_0.75.0_darwin_arm64_signed.zip"
      sha256 "292ee8ae477512da0b3592b35fd4e6d5652c68cce76db974093ff8719249f16c"
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
