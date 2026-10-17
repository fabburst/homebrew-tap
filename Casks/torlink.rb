cask "torlink" do
  version "null"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  url "https://github.com/fabburst/torlink-macos/releases/download/v#{version}-mac/torlink-macos-arm64.zip"
  name "torlink"
  desc "Standalone macOS torrent finder and downloader — no Node.js required"
  homepage "https://github.com/fabburst/torlink-macos"

  depends_on arch: :arm64

  binary "torlink-macos-arm64", target: "torlink"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "-r", "com.apple.quarantine", staged_path.to_s]
  end
end
