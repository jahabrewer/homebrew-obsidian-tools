class NoteCompiler < Formula
  desc "Compiles notes from an Obsidian vault into one text file"
  homepage "https://github.com/jahabrewer/obsidian-tools"
  url "https://github.com/jahabrewer/obsidian-tools/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "04e2aed9831a128ebac653294ea4df15700506de3474ab0a4f6dabf2221871ca"
  license "GPL-3.0-only"

  depends_on "yq"

  def install
    inreplace "note-compiler.sh", "__SCRIPT_VERSION__=\"DEVELOPMENT_VERSION_#_NEEDS_REPLACEMENT_BY_BUILD_#\"", "__SCRIPT_VERSION__=\"#{version}\""
    bin.install "note-compiler.sh" => "note-compiler"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/note-compiler 2>&1", 1)
  end
end
