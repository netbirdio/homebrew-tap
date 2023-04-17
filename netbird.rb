# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.16.0"
  license "BSD3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.16.0/netbird_0.16.0_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "5ed865f313822a0bfb4494de5487d90034dea8a666e8b3b4b047491163b34374"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.16.0/netbird_0.16.0_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "35d217584cbdb35fff0d8c746e0338fc2101df7c201c0a738f80d806fd77790c"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.16.0/netbird_0.16.0_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "31105e9b2d75ca8e8eb92cebdb692b8d88ded3ad68638f6f1d9c5f56d3b34473"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.16.0/netbird_0.16.0_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "048bf9fdf125b9e00f8754c5aaab30ab107e0b0ff02c0e8be72b221e49fa773a"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.16.0/netbird_0.16.0_linux_armv6.tar.gz", using: CurlDownloadStrategy
      sha256 "c2caa05f7a1bc433347a91e521e8f3c3a94c75db0c3dd35b0e4d325b20cc1cdf"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
