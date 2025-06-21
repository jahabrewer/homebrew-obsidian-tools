# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class ObsidianBackup < Formula
  desc "Backs up an Obsidian vault" # Placeholder, please verify/update
  homepage "https://github.com/jahabrewer/obsidian-tools"
  url "https://github.com/jahabrewer/obsidian-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7a29ffaa3da997d2791299576f1fe6f3fd98731a5b8742e3f2c38cee71edf1fd"
  license "GPL-3.0-only"

  depends_on "yq" # Assuming this script also needs yq, please verify

  def install
    # The tarball extracts to a directory like 'obsidian-tools-0.1.0'.
    # 'obsidian-backup.sh' is expected to be at the root of that directory.
    bin.install "obsidian-backup.sh" => "obsidian-backup"
  end

  test do
    # Assumes script prints "Usage" and exits 1 if no args are given.
    assert_match "Usage", shell_output("#{bin}/obsidian-backup", 1)
  end
end
