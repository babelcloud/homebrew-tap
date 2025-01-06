class Ht < Formula
    desc "Headless terminal providing programmatic access to a terminal interface"
    homepage "https://github.com/andyk/ht"
    version "0.3.0"
    license "Apache-2.0"
  
    base_url = "https://github.com/andyk/ht/releases/download/v#{version}"
    
    if Hardware::CPU.arm?
      url "#{base_url}/ht-aarch64-apple-darwin"
      sha256 "d24f56b3ec95deaf68af0ea84a1dcab6fb60534ad1be7a45ea8710a0f0072aa3"
    else
      url "#{base_url}/ht-x86_64-apple-darwin"
      sha256 "5ada7d5102413dda42550e88d578f39b1b878afd1b115e60a655334dced2bd52"
    end
  
    def install
      if Hardware::CPU.arm?
        mv "ht-aarch64-apple-darwin", "ht"
      else
        mv "ht-x86_64-apple-darwin", "ht"
      end
      bin.install "ht"
    end
  
    test do
      assert_match "ht #{version}", shell_output("#{bin}/ht --version")
    end
  end
  