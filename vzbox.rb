require_relative "private_strategy"

class Vzbox < Formula
  desc "vzbox"
  homepage "https://github.com/babelcloud/vzbox"
  version "v0.2.2"
  url "https://github.com/babelcloud/vzbox/releases/download/#{version}/vzbox",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "5aab343db00e26933bfb8ef789aa37408e1284768bc54255cdb086f9ee11f25e"

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
