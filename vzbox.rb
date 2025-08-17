require_relative "private_strategy"

class Vzbox < Formula
  desc "vzbox"
  homepage "https://github.com/babelcloud/vzbox"
  version "v.0.3.1"
  url "https://github.com/babelcloud/vzbox/releases/download/#{version}/vzbox",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "72638a57f1a219171a3bab4fda7333ac959b15c4938b657a0ba3ce9fdbb3f41e"

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
