# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.38.2"
  license "BSD3"

  on_macos do
    on_intel do
      url "https://github.com/netbirdio/netbird/releases/download/v0.38.2/netbird_0.38.2_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "51842de2aa86d33f521eab6013a8b2ecb38fd396c7899e9c0941ac321b689b54"

      def install
        bin.install "netbird"
      end
    end
    on_arm do
      url "https://github.com/netbirdio/netbird/releases/download/v0.38.2/netbird_0.38.2_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "f6e05cb490a48647a53de186fbffc52a9d63c7ea0308efd160be60022161fcaf"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.38.2/netbird_0.38.2_linux_amd64.tar.gz", using: CurlDownloadStrategy
        sha256 "79c15a5388863ab7743dc41d090359afd31e285d42596e050b33ee96d936c213"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.38.2/netbird_0.38.2_linux_armv6.tar.gz", using: CurlDownloadStrategy
        sha256 "d465a7783022d49636c9d0d408d4365914e30f64f4a291aaec454c0121950f78"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.38.2/netbird_0.38.2_linux_arm64.tar.gz", using: CurlDownloadStrategy
        sha256 "77eb56ab99bb1b121c5c69474d2f27e690366b66873f2ec28d7f24fd5af5833b"

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
