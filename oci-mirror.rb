require_relative "private_strategy"

class OciMirror < Formula
  desc "oci-mirror"
  homepage "https://github.com/babelcloud/oci-mirror"
  version "v0.1.1"
  url "https://github.com/babelcloud/oci-mirror/releases/download/#{version}/oci-mirror",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "5bb33260b7a0cff1a1d0778d7f2509a136c5a678d1becb3c848f0c498d925009"

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
