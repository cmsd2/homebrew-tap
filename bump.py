#!/usr/bin/env python3
"""Update Formula/aximar-tools.rb, Formula/mxpm.rb, Casks/aximar.rb and
Casks/mdview.rb to the latest published (non-draft, non-prerelease)
cmsd2/aximar, cmsd2/maxima-mxpm and cmsd2/mdview releases. Stdlib only.

Prints the names of changed files; exits 0 either way."""
import hashlib, json, re, sys, urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def get(url):
    with urllib.request.urlopen(url) as r:
        return r.read()


def sha256(url):
    return hashlib.sha256(get(url)).hexdigest()


def releases_of(repo):
    return json.loads(get(f"https://api.github.com/repos/{repo}/releases?per_page=50"))


def latest(releases, prefix, required=True):
    for r in releases:  # API returns newest first
        tag = r["tag_name"]
        # plain X.Y.Z only: ignore -rc1 style tags even if published
        if (not r["draft"] and not r["prerelease"] and tag.startswith(prefix)
                and re.fullmatch(r"\d+\.\d+\.\d+", tag[len(prefix):])):
            return tag[len(prefix):]
    if required:
        sys.exit(f"no published release with tag prefix {prefix!r}")
    return None


def rewrite(path, fn):
    old = path.read_text()
    new = fn(old)
    if new != old:
        path.write_text(new)
        print(path.relative_to(ROOT))


def dmg_cask(path, base, version, stem):
    """Point a two-arch DMG cask (arm: aarch64, intel: x64) at `version`."""
    def cask(text):
        arm = sha256(f"{base}/v{version}/{stem}_{version}_aarch64.dmg")
        intel = sha256(f"{base}/v{version}/{stem}_{version}_x64.dmg")
        text = re.sub(r'(?m)^(\s*version )"[^"]*"', rf'\1"{version}"', text)
        text = re.sub(r'arm:(\s+)"[0-9a-f]*"', rf'arm:\1"{arm}"', text)
        text = re.sub(r'intel:(\s+)"[0-9a-f]*"', rf'intel:\1"{intel}"', text)
        return text

    rewrite(path, cask)


def tarball_formula(path, base, tag, stem):
    """Point a per-platform tarball formula at release `tag`. Every url line
    names a `stem-<target>` asset and is followed by its sha256 line."""
    def formula(text):
        def url_sub(m):
            url = f"{base}/{tag}/{m.group(2)}"
            return f'{m.group(1)}"{url}"\n{m.group(3)}sha256 "{sha256(url)}"'

        return re.sub(
            rf'(\s*url )"[^"]*/({re.escape(stem)}-[^"/]+)"\n(\s*)sha256 "[0-9a-f]*"',
            url_sub, text)

    rewrite(path, formula)


def main():
    releases = releases_of("cmsd2/aximar")
    base = "https://github.com/cmsd2/aximar/releases/download"

    # --- tools formula ---
    tarball_formula(ROOT / "Formula/aximar-tools.rb", base,
                    f"tools-v{latest(releases, 'tools-v')}", "aximar-tools")

    # --- mxpm formula ---
    tarball_formula(ROOT / "Formula/mxpm.rb",
                    "https://github.com/cmsd2/maxima-mxpm/releases/download",
                    f"v{latest(releases_of('cmsd2/maxima-mxpm'), 'v')}", "mxpm")

    # --- GUI cask ---
    dmg_cask(ROOT / "Casks/aximar.rb", base, latest(releases, "v"), "Aximar")

    # --- mdview cask (skipped until mdview has a published release) ---
    mv = latest(releases_of("cmsd2/mdview"), "v", required=False)
    if mv:
        dmg_cask(ROOT / "Casks/mdview.rb", "https://github.com/cmsd2/mdview/releases/download",
                 mv, "mdview")


main()
