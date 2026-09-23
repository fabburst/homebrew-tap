cask "fabquit" do
  version "0.2.0"
  sha256 "da5160124291b1794675c0aad19f50f1190c21810795fc3722b3a859fdbcaeef"

  url "https://github.com/fabburst/FabQuit/releases/download/v#{version}/FabQuit-v#{version}.zip"
  name "FabQuit"
  desc "Quit every running app at once, except the ones you keep"
  homepage "https://github.com/fabburst/FabQuit"

  auto_updates true
  depends_on macos: :sonoma

  app "FabQuit.app"

  # Not notarized: remove the quarantine flag so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "-r", "com.apple.quarantine", "FabQuit.app"],
        chdir:        "{{appdir}}",
        must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/io.github.fabburst.fabquit.plist",
    "~/Library/Caches/io.github.fabburst.fabquit",
    "~/Library/HTTPStorages/io.github.fabburst.fabquit",
  ]
end
