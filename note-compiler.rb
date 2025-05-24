class NoteCompiler < Formula
  desc "Compiles notes from an Obsidian vault into one text file"
  homepage "https://github.com/jahabrewer/obsidian-tools"
  url "https://github.com/jahabrewer/obsidian-tools/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "9b8f3b3d499039156c2776e2eea03248fc416bb3b6d51034853f58b2f929fb15"
  license "GPL-3.0-only"

  depends_on "yq"

  def install
    inreplace "note-compiler.sh", "__SCRIPT_VERSION__=\"DEVELOPMENT_VERSION_#_NEEDS_REPLACEMENT_BY_BUILD_#\"", "__SCRIPT_VERSION__=\"#{version}\""
    bin.install "note-compiler.sh" => "note-compiler"
  end

  test do
    # Check for semantic version output
    assert_match(/^\d+\.\d+\.\d+$/, shell_output("#{bin}/note-compiler --version"))
  end
end
