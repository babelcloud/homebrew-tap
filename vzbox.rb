require_relative "private_strategy"

class Vzbox < Formula
  desc "vzbox"
  homepage "https://github.com/babelcloud/vzbox"
  version "v0.2.4"
  url "https://github.com/babelcloud/vzbox/releases/download/#{version}/vzbox",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "f582bbda3f8a80dd8df6b0f4cda5f267a2c858c4d059772ce6bb31395f20c25d"

  depends_on "qemu"

  on_macos do
    depends_on :macos => :sequoia
  end

  on_linux do
    odie "This formula is only supported on macOS."
  end

  def install
    bin.install stable.url.split("/")[-1] => "vzbox"
  end

  service do
    run [opt_bin/"vzbox"]
    keep_alive crashed: true
  end

  test do
    system "#{bin}/vzbox", "--version"
  end
end
