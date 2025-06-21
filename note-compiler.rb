class NoteCompiler < Formula
  desc "Compiles notes from an Obsidian vault into one text file"
  homepage "https://github.com/jahabrewer/obsidian-tools"
  url "https://github.com/jahabrewer/obsidian-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e5a40d9369d8be8665b992fb453cbf31eeb98f96a64f86486ca319884a2291ad"
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
