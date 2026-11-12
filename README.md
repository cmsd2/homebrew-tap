# homebrew-tap

Homebrew tap for [Aximar](https://github.com/cmsd2/aximar),
[mxpm](https://github.com/cmsd2/maxima-mxpm) and
[mdview](https://github.com/cmsd2/mdview).

```sh
brew install --cask cmsd2/tap/aximar   # GUI app + the tools below
brew install cmsd2/tap/aximar-tools    # just maxima-lsp, maxima-dap, aximar-mcp
brew install cmsd2/tap/mxpm            # Maxima package manager
brew install --cask cmsd2/tap/mdview   # Markdown viewer
```

`bump.py` keeps all four files in step with the latest published GitHub
releases (`v*` for the apps and mxpm, `tools-v*` for the aximar tools). The `Bump`
workflow runs it hourly and on `repository_dispatch` (`aximar-released` or
`mdview-released`). The mdview cask keeps its placeholder version until
cmsd2/mdview publishes its first release.
