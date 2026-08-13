cask "torlink" do
  version "1.2.0"
  sha256 "f585d39e6a49bf2c8945a863343a39d305c5af943a5b8aa484434beb3ec47ae4"

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
