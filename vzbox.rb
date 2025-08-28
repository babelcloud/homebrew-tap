require_relative "private_strategy"

class Vzbox < Formula
  desc "vzbox"
  homepage "https://github.com/babelcloud/vzbox"
  version "v0.3.2"
  url "https://github.com/babelcloud/vzbox/releases/download/#{version}/vzbox",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "e7fd341d18c2a97e37afeb2bb7e3e42df0d4c9bdcda6afe36fc69debfdd1973c"

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
