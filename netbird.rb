# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.28.4"
  license "BSD3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.4/netbird_0.28.4_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "888edb86353c1fcb0d0c7a45557476d6d10c7dfd930e76b9dfb0ed8f3de4730c"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.4/netbird_0.28.4_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "28f49f214aa2bdfcff0d0ddf8e4c54781363627cdcaca53d30235c80bc4b68b2"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.4/netbird_0.28.4_linux_armv6.tar.gz", using: CurlDownloadStrategy
      sha256 "0c185f9f706f086cb81a8e0703cd9f83a9fe347de21d945722d323ddae9cbbda"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.4/netbird_0.28.4_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "fd426e67ff8c0516642cf4e6c6115a0e4a2a9fc16a8eba3f9b3534e8a06e3f4e"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.28.4/netbird_0.28.4_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "7f0d6acb6127857b44ae59c8aa57933ff8c5c9155cb95be2e4af32c6d3dcb477"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
