


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.21.2"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.2/netbird-ui_0.21.2_darwin_amd64_signed.zip"
      sha256 "13be5843426243a852af7c113246812daa154d3635f5ef7622091d9764b1b249"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.21.2/netbird-ui_0.21.2_darwin_arm64_signed.zip"
      sha256 "fb430bc35eb2cabd6916be0895476793f47014ec7548cb5f76fc00b667ea3973"
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