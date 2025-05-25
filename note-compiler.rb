class NoteCompiler < Formula
  desc "Compiles notes from an Obsidian vault into one text file"
  homepage "https://github.com/jahabrewer/obsidian-tools"
  url "https://github.com/jahabrewer/obsidian-tools/archive/refs/tags/v0.5.0-test.2.tar.gz"
  sha256 "993098723ef5da2d13cda25687a32bc37e57900f9d5fdfd1d3f8e8a07d0732c5"
  license "GPL-3.0-only"

  depends_on "yq"

  def install
    inreplace "note-compiler.sh", "__SCRIPT_VERSION__=\"DEVELOPMENT_VERSION_#_NEEDS_REPLACEMENT_BY_BUILD_#\"", "__SCRIPT_VERSION__=\"#{version}\""
    bin.install "note-compiler.sh" => "note-compiler"
    
    # Install zsh completions
    zsh_completion.install "_note-compiler"
  end

  test do
    # Check for semantic version output
    assert_match(/^\d+\.\d+\.\d+$/, shell_output("#{bin}/note-compiler --version"))
  end
end
