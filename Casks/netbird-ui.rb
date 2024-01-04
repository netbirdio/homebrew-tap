


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.25.3"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.3/netbird-ui_0.25.3_darwin_amd64_signed.zip"
      sha256 "8db939024e938a8b0727358439fbcbf7a1e1f1f2796035336885b4db6a26ad53"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.3/netbird-ui_0.25.3_darwin_arm64_signed.zip"
      sha256 "011adfb092bd0af254bb209cc53455efbf89f93edee5748464ebf87195efd01f"
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