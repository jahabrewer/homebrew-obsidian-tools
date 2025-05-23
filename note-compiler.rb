# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class NoteCompiler < Formula
  desc "Compiles notes from an Obsidian vault into one text file"
  homepage "https://github.com/jahabrewer/obsidian-tools"
  url "https://github.com/jahabrewer/obsidian-tools/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "562db677194a5d706fd17ce9d799c929aaa19b52c1714f175e096187dc445558"
  license "GPL-3.0-only"

  depends_on "yq"

  def install
    # The tarball extracts to a directory like 'obsidian-tools-0.1.0'.
    # 'note-compiler.sh' is expected to be at the root of that directory.
    bin.install "note-compiler.sh" => "note-compiler"
  end

  test do
    # Assumes script prints "Usage" and exits 1 if no args are given.
    assert_match "Usage", shell_output("#{bin}/note-compiler", 1)
  end
end
