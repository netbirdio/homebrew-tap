


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.54.0"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.54.0/netbird-ui_0.54.0_darwin_amd64_signed.zip"
      sha256 "a0ca278890947ae39d2a7c55f257fc32ef932954b15d51da050c4baa6825cf69"
      app "netbird_ui_darwin", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.54.0/netbird-ui_0.54.0_darwin_arm64_signed.zip"
      sha256 "c88b83fcfff76c567638dae131e6dd7f98117c11b397099ebe52b9602a17a2c3"
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
