class Mxpm < Formula
  desc "Package manager for the Maxima computer algebra system"
  homepage "https://github.com/cmsd2/maxima-mxpm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.2/mxpm-aarch64-apple-darwin.tar.gz"
      sha256 "e241585094a3a9bd0f3a18351293efe6b70bfa64f29b6da43a03505548f0999d"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.2/mxpm-x86_64-apple-darwin.tar.gz"
      sha256 "0f5e449de9af7d574005a391750d053f37380b3f4a6947ab31c408eb78b9eff0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.2/mxpm-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd13506234bb24c81056e1b631718ec7a172264da2b2a052d2eb49dde7d48866"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.2/mxpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1cbfebcafb4f47eb699091c6c36d0c589a8e3e89f43aa5eb0253e4fe3b0478e"
    end
  end

  def install
    bin.install "mxpm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mxpm --version")
  end
end
