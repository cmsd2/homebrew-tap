class Mxpm < Formula
  desc "Package manager for the Maxima computer algebra system"
  homepage "https://github.com/cmsd2/maxima-mxpm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.4/mxpm-aarch64-apple-darwin.tar.gz"
      sha256 "b3225ab1f8a8a1fc91c97640f7c25c2f2f95e6ffabb1239798079b8e5f768c36"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.4/mxpm-x86_64-apple-darwin.tar.gz"
      sha256 "398467d6482a11e9ddd0439dc9d0ec1fee5473b72770f68dff38ac245731e22e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.4/mxpm-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f5e1b5da0668b58154c966db0bc9d45afb86e7be7707e7a8b5d6a2aa6e9372d"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.4/mxpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eebb683711388981d228a1fc4a5fc30f46e5b4e1ad2cd04833fd37b85bbd9986"
    end
  end

  def install
    bin.install "mxpm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mxpm --version")
  end
end
