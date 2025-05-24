class NoteCompiler < Formula
  desc "Compiles notes from an Obsidian vault into one text file"
  homepage "https://github.com/jahabrewer/obsidian-tools"
  url "https://github.com/jahabrewer/obsidian-tools/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "cbf8770ffc97c0372cbc10f35e48d0fe7101f2938476c4f3acfd4d02a8c3c135"
  license "GPL-3.0-only"

  depends_on "yq"

  def install
    inreplace "note-compiler.sh", "DEVELOPMENT_VERSION_#_NEEDS_REPLACEMENT_BY_BUILD_#", version.to_s
    bin.install "note-compiler.sh" => "note-compiler"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/note-compiler 2>&1", 1)
  end
end
