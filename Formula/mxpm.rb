class Mxpm < Formula
  desc "Package manager for the Maxima computer algebra system"
  homepage "https://github.com/cmsd2/maxima-mxpm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.6/mxpm-aarch64-apple-darwin.tar.gz"
      sha256 "28a313dec7decb8adb1eaa5b97e2bb071185613e53ce9f3abe0a59495d648d5a"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.6/mxpm-x86_64-apple-darwin.tar.gz"
      sha256 "6f633e3938af87175c0d4a3597c6ac15dc2984182d31a3a2fe148704cffddeec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.6/mxpm-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e8611744e1dfa4cbf6d0e7ca21bc0f8c35a9d78f5de2879d6ff09ced4ba0404"
    end
    on_intel do
      url "https://github.com/cmsd2/maxima-mxpm/releases/download/v0.8.6/mxpm-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b77f398a536314cd71793ba1655c10ca599495b12e11354b48bc45ce6f18bfcf"
    end
  end

  def install
    bin.install "mxpm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mxpm --version")
  end
end
