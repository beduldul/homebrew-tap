# homebrew-tap

Homebrew packages for [beduldul](https://github.com/beduldul)'s tools.

## Install

```sh
brew install beduldul/tap/ai-policy
```

Homebrew 7 asks whether to trust a cask from a third-party tap. If you would
rather answer that up front:

```sh
brew trust --cask beduldul/tap/ai-policy
brew install --cask beduldul/tap/ai-policy
```

## Packages

| Package | What it does |
|---|---|
| `ai-policy` | Check whether a repository accepts AI-assisted contributions, before you open the pull request |

`ai-policy` ships as a **cask**, not a formula: it installs a prebuilt binary,
so there is no Go toolchain and no compiler involved. A formula without a
bottle makes Homebrew demand a current Xcode even when nothing is compiled,
which is a needless requirement for a tool that only downloads a binary.

On Linux, use `go install github.com/beduldul/ai-policy@latest` or grab the
binary from the [releases page](https://github.com/beduldul/ai-policy/releases).
