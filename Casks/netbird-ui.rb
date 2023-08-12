


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.22.4"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.4/netbird-ui_0.22.4_darwin_amd64_signed.zip"
      sha256 "43b877d8d860597982799554d26829567c961faef5c66361ca067da8e1477172"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.4/netbird-ui_0.22.4_darwin_arm64_signed.zip"
      sha256 "89f987cd914c0457aac002fb8314319dfa161d28792385ed781d11dde1074bd6"
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