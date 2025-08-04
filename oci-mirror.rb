require_relative "private_strategy"

class OCIMirror < Formula
  desc "oci-mirror"
  homepage "https://github.com/babelcloud/oci-mirror"
  version "v0.1.0"
  url "https://github.com/babelcloud/oci-mirror/releases/download/#{version}/oci-mirror",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "9da2b53ee941910827c759718af645c760410b4b053bdde88c808cb4ea9ce9d0"

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
