class NoteCompiler < Formula
  desc "Compiles notes from an Obsidian vault into one text file"
  homepage "https://github.com/jahabrewer/obsidian-tools"
  url "https://github.com/jahabrewer/obsidian-tools/archive/refs/tags/v0.5.0-test.3.tar.gz"
  sha256 "9fa07a2b91755f20a781d8a57f6b84b33fe291a95bbc6247b8bded916ba36c2b"
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
