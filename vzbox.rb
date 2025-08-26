require_relative "private_strategy"

class Vzbox < Formula
  desc "vzbox"
  homepage "https://github.com/babelcloud/vzbox"
  version "v0.3.1"
  url "https://github.com/babelcloud/vzbox/releases/download/#{version}/vzbox",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "e14b8b73397106dcdbed2c96300d61fef2f3d23f127f841eb2ba6e837869be90"

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
