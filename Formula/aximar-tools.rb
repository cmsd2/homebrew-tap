class AximarTools < Formula
  desc "Maxima language server, debug adapter and MCP server from the Aximar project"
  homepage "https://github.com/cmsd2/aximar"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.2/aximar-tools-aarch64-apple-darwin.tar.gz"
      sha256 "2b53cd226662a21bd31e87bc7c551f1e67e4b3cd438353d88fcdc73150614e6d"
    end
    on_intel do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.2/aximar-tools-x86_64-apple-darwin.tar.gz"
      sha256 "42db289e978486828565ffc20b28f5013583399999ecdfd07ceec1922ac18f00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.2/aximar-tools-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93acbf2e2801fe6d922f98292af0d76c012452e2622c2c93b75516069827ac86"
    end
    on_intel do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.2/aximar-tools-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a903e707a71b90d224430ff5e48a86c238bc28b538fc2d52d28e5f16d58f68d2"
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
