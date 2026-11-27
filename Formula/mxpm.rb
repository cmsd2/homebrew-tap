class Mxpm < Formula
  desc "Package manager for the Maxima computer algebra system"
  homepage "https://github.com/cmsd2/maxima-mxpm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.1/mxpm-aarch64-apple-darwin.tar.gz"
      sha256 "326a00d890f9c0c0b74885a446e0922ff43a372e85704e5ec84d23237e91657d"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.1/mxpm-x86_64-apple-darwin.tar.gz"
      sha256 "a7288289565a2d3bf8a463b7ed2366314099e7ba990a04b889348b0d53347c53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.1/mxpm-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bba97c353e262db6fdf89b58efa0360248d5633109d9cd26db6db2d5df75b677"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.1/mxpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b653b070a92011e48e21fbeac6f57e6baacf1f9bfdcffeb795b441548985de19"
    end
  end

  def install
    bin.install "mxpm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mxpm --version")
  end
end
