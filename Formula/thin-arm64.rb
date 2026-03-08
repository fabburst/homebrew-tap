class ThinArm64 < Formula
  desc "Thin universal macOS apps to ARM64 only — libère de l'espace sur Apple Silicon"
  homepage "https://github.com/fabburst/thin-arm64"
  url "https://github.com/fabburst/thin-arm64/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "79de8db03d6d74d8730cdeaf5755e0bc6fea90da4497f82c86b2202f06b1c718"
  license "MIT"

  depends_on "go" => :build
  depends_on arch: :arm64

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}"), "."
  end

  test do
    assert_match "thin-arm64 v#{version}", shell_output("#{bin}/thin-arm64 --version")
  end
end
