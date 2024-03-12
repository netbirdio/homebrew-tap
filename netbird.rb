# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.26.3"
  license "BSD3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.3/netbird_0.26.3_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "45c6af60ca46a1d37a8ddac4673ee828dbad59d5a4d6e47b4eae49fb852a6102"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.3/netbird_0.26.3_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "6d401ca5496067df87c91156b137957ed04dbb7fc02b05bcbc999300bb58e6f3"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.3/netbird_0.26.3_linux_armv6.tar.gz", using: CurlDownloadStrategy
      sha256 "f32b74743497164ead2d9b73d7212172023f6da433564b423718ab9214511233"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.3/netbird_0.26.3_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "6565db0c881b40098067319ad587bef0abdf4ef72d10c390e519761c4b8ff3c4"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.26.3/netbird_0.26.3_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "ccf40866c1b3de2d20d168097a8e202e023c9058e7fbccd4c8b585d4acf1704e"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
