


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.72.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.72.0/netbird-ui_0.72.0_darwin_amd64_signed.zip"
      sha256 "f6ba1a932eb7009097902aee3f14a1995114286dfc4bd9a30d50788f04215ca2"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.72.0/netbird-ui_0.72.0_darwin_arm64_signed.zip"
      sha256 "1ec41c7365bcc0df757f0b615b993a63f99dcb5477593182abb4470fd9318614"
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
