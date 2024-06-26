# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.28.3"
  license "BSD3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.3/netbird_0.28.3_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "c68cdf372980ea85251a9cbc45c26ff166b17a9a4f6f96b2f8f7228f7fb4a236"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.3/netbird_0.28.3_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "e49a8e63379662992a5c9e20b0b467b21fa557bf4ea84c18d9a08420935da640"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.3/netbird_0.28.3_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "ed4bfd802b9588a97161a35dd632d2016e2538e4fda754d2d79d996cef25fd1f"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.3/netbird_0.28.3_linux_armv6.tar.gz", using: CurlDownloadStrategy
      sha256 "56d8b191e7d1be887f56fc65d85324ea30bee81b0f2afbdf4086ab1cf07edad2"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.3/netbird_0.28.3_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "bc6b49a2bba795f85f4676500a8a91511ebe64c939baa725993c5d4e26e9def0"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
