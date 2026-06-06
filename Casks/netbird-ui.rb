


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.72.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.72.2/netbird-ui_0.72.2_darwin_amd64_signed.zip"
      sha256 "75340b06c338a31e26e2ee4905708edb12701d3faf6897cddc4d491b17af811f"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.72.2/netbird-ui_0.72.2_darwin_arm64_signed.zip"
      sha256 "cb8c760269d6ea3f7b2b49fc85fd1ad70e6de1dbef279d543d542149fe91be4a"
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
