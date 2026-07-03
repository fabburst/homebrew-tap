class Torlink < Formula
  desc "Standalone macOS torrent finder and downloader — no Node.js required"
  homepage "https://github.com/fabburst/torlink-macos"
  url "https://github.com/fabburst/torlink-macos/releases/latest/download/torlink-macos-arm64"
  sha256 "55af18f6cf6c6696836a8a6ed79d334402056be83bae32d2629659bb0513334b"
  version "1.2.0"
  license "MIT"

  depends_on arch: :arm64

  def install
    bin.install "torlink-macos-arm64" => "torlink"
  end

  test do
    assert_predicate bin/"torlink", :exist?
    assert_predicate bin/"torlink", :executable?
  end
end
