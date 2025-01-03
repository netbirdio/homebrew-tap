# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.35.2"
  license "BSD3"

  on_macos do
    on_intel do
      url "https://github.com/netbirdio/netbird/releases/download/v0.35.2/netbird_0.35.2_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "43b2d0bc12d3895187e932796655153cb52a26dfebad1692be49e50dfbd8486c"

      def install
        bin.install "netbird"
      end
    end
    on_arm do
      url "https://github.com/netbirdio/netbird/releases/download/v0.35.2/netbird_0.35.2_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "898a2387dfdfc521d00fcdae3d3b94457caee84285d9153ba860d8ef17206795"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.35.2/netbird_0.35.2_linux_amd64.tar.gz", using: CurlDownloadStrategy
        sha256 "dd727f71b54812ba234dbc7cf246bc997ef265b8289ff136c316195c54731890"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.35.2/netbird_0.35.2_linux_armv6.tar.gz", using: CurlDownloadStrategy
        sha256 "3698408434af9fd4edaa373ce9c0a6d02a4364ea8213cb6fec03399ea65d8388"

        def install
          bin.install "netbird"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/netbirdio/netbird/releases/download/v0.35.2/netbird_0.35.2_linux_arm64.tar.gz", using: CurlDownloadStrategy
        sha256 "6564b9c7cd685b7fe0c9b704bb2d9dbaadb74e73102e5da1b32899731b285663"

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
