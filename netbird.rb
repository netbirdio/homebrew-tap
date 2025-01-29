# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.36.5"
  license "BSD3"

  on_macos do
    on_intel do
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.5/netbird_0.36.5_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "7b282d8ff87ce830cc1326048180c5695c95d602e25eb49ef7037654b8ed1ced"

      def install
        bin.install "netbird"
      end
    end
    on_arm do
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.5/netbird_0.36.5_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "e3b00b2098233f6b4d0709d2b387b464b307461d773b1364ceef836ad169d829"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.36.5/netbird_0.36.5_linux_amd64.tar.gz", using: CurlDownloadStrategy
        sha256 "ec63cc380d843730889a2834491eca8f9787ed1be34a8a2aae88ff5cdb31ccb0"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.36.5/netbird_0.36.5_linux_armv6.tar.gz", using: CurlDownloadStrategy
        sha256 "1fc80f1253d310cad229d398aa6127bf4467c8ee6cb3493e46e50fc46fa0115c"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.36.5/netbird_0.36.5_linux_arm64.tar.gz", using: CurlDownloadStrategy
        sha256 "383d7f870f95fe8cca145f8395ed9b8aa0355d52914adbdbe0a0253c572684d7"

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
