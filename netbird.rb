# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.36.0"
  license "BSD3"

  on_macos do
    on_intel do
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.0/netbird_0.36.0_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "d080ee3688749b7b68d8503f5bca3d772aa6a12f47379f92c966f456134238b9"

      def install
        bin.install "netbird"
      end
    end
    on_arm do
      url "https://github.com/netbirdio/netbird/releases/download/v0.36.0/netbird_0.36.0_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "11c7f4da40e96ffd752b36f48122461f468f158f2c2506aab7e90b073e3822a5"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.36.0/netbird_0.36.0_linux_amd64.tar.gz", using: CurlDownloadStrategy
        sha256 "51b00e5fc327ef7897b319d263f5aa5c6dfd375ac47a2683b801719792f90c9f"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.36.0/netbird_0.36.0_linux_armv6.tar.gz", using: CurlDownloadStrategy
        sha256 "d757878fcbdac83bd5b3591aa6caf5b0e09b2e9581d6c51b9efc5a3edb649230"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.36.0/netbird_0.36.0_linux_arm64.tar.gz", using: CurlDownloadStrategy
        sha256 "1148140d7f82bcfab3a88a8e655f6a8af063379da4b58aeefccb62afe85d14b5"

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
