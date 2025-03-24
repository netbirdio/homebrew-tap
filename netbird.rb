# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.39.1"
  license "BSD3"

  on_macos do
    on_intel do
      url "https://github.com/netbirdio/netbird/releases/download/v0.39.1/netbird_0.39.1_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "50a49595651b020a41b90c4d27195379d7886478afbf3d1b9710226f5eca8f0a"

      def install
        bin.install "netbird"
      end
    end
    on_arm do
      url "https://github.com/netbirdio/netbird/releases/download/v0.39.1/netbird_0.39.1_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "01154f0e5dd947650e3041eff390864e477cfd69d35b4fd3dcd1160611864b53"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.39.1/netbird_0.39.1_linux_amd64.tar.gz", using: CurlDownloadStrategy
        sha256 "ac4dbf589cf33dc1c347a6dba569cdcaf8a6915f88c6a7baffdb35fcf9b954f0"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.39.1/netbird_0.39.1_linux_armv6.tar.gz", using: CurlDownloadStrategy
        sha256 "10de10026b8e2eed5b7244e9d25f33d1c139f7e808828537290de55969ad0552"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.39.1/netbird_0.39.1_linux_arm64.tar.gz", using: CurlDownloadStrategy
        sha256 "ec61b6c0fd64dd9403bc7d8095f67f6abb8549f6ee44fedea95e02df1a677d87"

        def install
          bin.install "netbird"
        end
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
