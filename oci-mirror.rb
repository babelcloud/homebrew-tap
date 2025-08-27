require_relative "private_strategy"

class OciMirror < Formula
  desc "oci-mirror"
  homepage "https://github.com/babelcloud/oci-mirror"
  version "v0.1.3"
  url "https://github.com/babelcloud/oci-mirror/releases/download/#{version}/oci-mirror",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "f970a89ff3274c5d8d120ce7609d8e5acc70c1cc270365db5e29b1fbe4f5b7f0"

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
