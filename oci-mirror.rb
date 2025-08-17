require_relative "private_strategy"

class OciMirror < Formula
  desc "oci-mirror"
  homepage "https://github.com/babelcloud/oci-mirror"
  version "v0.1.2"
  url "https://github.com/babelcloud/oci-mirror/releases/download/#{version}/oci-mirror",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "44d8c3ff5963161d9479a79b57a6cfcc6b31ee19e01898d16fbbf1815721cd8d"

  on_macos do
    depends_on :macos => :sequoia
  end

  on_linux do
    odie "This formula is only supported on macOS."
  end

  def install
    bin.install stable.url.split("/")[-1] => "oci-mirror"
  end

  service do
    run [opt_bin/"oci-mirror"]
    keep_alive crashed: true
  end

  test do
    system "#{bin}/oci-mirror", "--version"
  end
end
