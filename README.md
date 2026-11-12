# homebrew-tap

Homebrew tap for [Aximar](https://github.com/cmsd2/aximar),
[mxpm](https://github.com/cmsd2/maxima-mxpm) and
[mdview](https://github.com/cmsd2/mdview).

Homebrew 7 loads formulae and casks from a third-party tap only once you
trust it, so tap and trust it first:

```sh
brew tap cmsd2/tap
brew trust cmsd2/tap
```

Then install what you need:

```sh
brew install --cask cmsd2/tap/aximar   # GUI app + the tools below
brew install cmsd2/tap/aximar-tools    # just maxima-lsp, maxima-dap, aximar-mcp
brew install cmsd2/tap/mxpm            # Maxima package manager
brew install --cask cmsd2/tap/mdview   # Markdown viewer
```

`bump.py` keeps all four files in step with the latest published GitHub
releases (`v*` for the apps and mxpm, `tools-v*` for the aximar tools). It
takes each checksum from the `digest` the releases API reports for the asset,
so it downloads nothing unless an asset lacks one.

The `Bump` workflow runs it on `repository_dispatch` (`aximar-released`,
`mdview-released` or `mxpm-released`), and once a day to catch a missed event.
Each source repo sends its event when a release goes out: aximar and mdview
from a `Notify tap` workflow on `release: published`, mxpm from the last step
of its release job. They authenticate with a `TAP_DISPATCH_TOKEN` secret, a
fine-grained PAT scoped to this repo with Contents read/write.
