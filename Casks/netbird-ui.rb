


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.29.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.0/netbird-ui_0.29.0_darwin_amd64_signed.zip"
      sha256 "208bd82e20841962b9bea232bb9459dfd6630c8ad6697798403ed81d450a0728"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.29.0/netbird-ui_0.29.0_darwin_arm64_signed.zip"
      sha256 "be9bdf7c08bc6016dad14faa662deed460fbebd56da5013326a19a19c74de375"
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