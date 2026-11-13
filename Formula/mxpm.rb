class Mxpm < Formula
  desc "Package manager for the Maxima computer algebra system"
  homepage "https://github.com/cmsd2/maxima-mxpm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.5/mxpm-aarch64-apple-darwin.tar.gz"
      sha256 "8aa93104d7eaf4d47109d483228076bc1b36c00e9f131561aa214468d7bea96d"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.5/mxpm-x86_64-apple-darwin.tar.gz"
      sha256 "77ec5de4ba00feaab42cffcd1ff90a5e0f5d01715a54cd73b25644ea0c57c337"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.5/mxpm-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4abfa40c6c238d4b1b8b113a3c9c6613d993bb17033ab5af5f50609113da7c64"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.5/mxpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14f62ec27b92c1386dafb46d55b51b436275d12bc39ea623dbbbe1de78514425"
    end
  end

  def install
    bin.install "mxpm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mxpm --version")
  end
end
