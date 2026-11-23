class AximarTools < Formula
  desc "Maxima language server, debug adapter and MCP server from the Aximar project"
  homepage "https://github.com/cmsd2/aximar"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.0/aximar-tools-aarch64-apple-darwin.tar.gz"
      sha256 "138ce1f2455f40004c70dc26069e65f82e6ec421070929157662d3bf69820f4e"
    end
    on_intel do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.0/aximar-tools-x86_64-apple-darwin.tar.gz"
      sha256 "ccee41a78c0e8cd4846a5666a76b2d1dd1b400ad609a0c26a26850e8f76c3a06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.0/aximar-tools-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d76e4ed4a5d7c03be06a924793ff83dd9c5c95304c67e1106b45b923967308f3"
    end
    on_intel do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.0/aximar-tools-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d52253be323f19289405186f9c5d9eae5606f6586207576aa2e236680c1bd2cc"
    end
  end

  def install
    bin.install "maxima-lsp", "maxima-dap", "aximar-mcp"
  end

  test do
    assert_predicate bin/"maxima-lsp", :executable?
    assert_predicate bin/"maxima-dap", :executable?
    assert_predicate bin/"aximar-mcp", :executable?
  end
end
