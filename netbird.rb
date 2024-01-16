# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.25.4"
  license "BSD3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.4/netbird_0.25.4_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "0638b89e8d018634108913cab308e0302ef14b95f1279cc9494de1f533e8cdd6"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.4/netbird_0.25.4_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "038bdacbb31a8d16f6429b96be727f86ec87b3eac55a12d7dc73d0703f4ba1be"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.4/netbird_0.25.4_linux_armv6.tar.gz", using: CurlDownloadStrategy
      sha256 "458bcc3a36e396c9c0b0686776838c8994a91991ab2c59e1f88084706afafd6c"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.4/netbird_0.25.4_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "087e0f8b4d0da4b05aad7ac7c1b971a9c5e738928719686eea2db71bf82ed19c"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.25.4/netbird_0.25.4_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "c3b91a01b56c9425376d6da72e4690d86050b1faa7bf2fd746a664ebdc72aad4"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
