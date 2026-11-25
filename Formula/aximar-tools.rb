class AximarTools < Formula
  desc "Maxima language server, debug adapter and MCP server from the Aximar project"
  homepage "https://github.com/cmsd2/aximar"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.1/aximar-tools-aarch64-apple-darwin.tar.gz"
      sha256 "e8bc7c0f13d979a646cf88e31abd9030cce30d14c16fe5e353fc36c941466b94"
    end
    on_intel do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.1/aximar-tools-x86_64-apple-darwin.tar.gz"
      sha256 "94f5d4bb6f3c37625cb792a21537c6111efdd4ed8646bdf330aee20b3bfb52da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.1/aximar-tools-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b66a5c29056698fe9590e16e5d1de3057bff6575ed40b36f91c7b73a7b3858a7"
    end
    on_intel do
      url "https://github.com/cmsd2/aximar/releases/download/tools-v0.6.1/aximar-tools-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0559966f2587f52a04ae2b82246cb3114ce6985875e7e77331c1c42e3be7937d"
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
