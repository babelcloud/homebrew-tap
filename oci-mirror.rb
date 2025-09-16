require_relative "private_strategy"

class OciMirror < Formula
  desc "oci-mirror"
  homepage "https://github.com/babelcloud/oci-mirror"
  version "v0.1.4"
  url "https://github.com/babelcloud/oci-mirror/releases/download/#{version}/oci-mirror",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "733d8cfd9e42b312c3a90ae98c044df7535a544e7333b39912921903bf92f6fd"

  on_macos do
    depends_on :macos => [:sequoia, :tahoe]
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
