class Mxpm < Formula
  desc "Package manager for the Maxima computer algebra system"
  homepage "https://github.com/cmsd2/maxima-mxpm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.0/mxpm-aarch64-apple-darwin.tar.gz"
      sha256 "754c90364cb6fcb20d7afee3c8a30ad9f352734b3924fcc54a7189a9221bccb8"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.0/mxpm-x86_64-apple-darwin.tar.gz"
      sha256 "96a29b999d8dc9c86710a9f27e3d245c34bb88a03eded365614507cd64266ce3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.0/mxpm-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f881f541a065a15c25975d68b058855c734e15964d8ea6cb7e6aaa828fdcf38"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.9.0/mxpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4081269fed90e83c5f559c29eb8b92cb24a1f3debab8891c523067254e3d860a"
    end
  end

  def install
    bin.install "mxpm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mxpm --version")
  end
end
