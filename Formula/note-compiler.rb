# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class NoteCompiler < Formula
  desc "A cross-platform Go CLI tool for compiling markdown notes"
  homepage "https://github.com/jahabrewer/note-compiler"
  version "1.0.3"
  license "GPL-3.0"

  on_macos do
    on_intel do
      url "https://github.com/jahabrewer/note-compiler/releases/download/v1.0.3/obsidian-tools_Darwin_x86_64.tar.gz"
      sha256 "7810066482639b825f9b055844ff1c867170f99c27a2276d0c64a4f7372a1da6"

      def install
        bin.install "note-compiler"
      end
    end
    on_arm do
      url "https://github.com/jahabrewer/note-compiler/releases/download/v1.0.3/obsidian-tools_Darwin_arm64.tar.gz"
      sha256 "4a24d09d215f410a2614c24a23cae96a5b41cddbb1d3bb8e725ab02855528ea9"

      def install
        bin.install "note-compiler"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jahabrewer/note-compiler/releases/download/v1.0.3/obsidian-tools_Linux_x86_64.tar.gz"
        sha256 "7763be5824d511cfdef3c4b36d5993c8fa083d3bab56b90ee5ae6b8a0d3ce806"

        def install
          bin.install "note-compiler"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/jahabrewer/note-compiler/releases/download/v1.0.3/obsidian-tools_Linux_armv6.tar.gz"
        sha256 "4c31fe46037357b88c1afe7ce44f58e991a7ec769022b7bdb8f6b72469259c47"

        def install
          bin.install "note-compiler"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jahabrewer/note-compiler/releases/download/v1.0.3/obsidian-tools_Linux_arm64.tar.gz"
        sha256 "9b269b8780ec62599409408fe2522c37aabd08ae49158b125cd8277bc08c7f35"

        def install
          bin.install "note-compiler"
        end
      end
    end
  end

  test do
    system "#{bin}/note-compiler", "--version"
  end
end
