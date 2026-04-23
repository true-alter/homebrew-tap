# truealter/homebrew-tap

ALTER Homebrew tap. Hosts the Formula for the [`@truealter/cli`](https://www.npmjs.com/package/@truealter/cli) npm package.

## Install

```bash
brew tap truealter/tap
brew install alter
```

Then:

```bash
alter login
```

## Updating

When a new `@truealter/cli` version ships to npm:

1. Compute the SHA256 of the published tarball:
   ```bash
   curl -fsSL https://registry.npmjs.org/@truealter/cli/-/cli-<ver>.tgz | sha256sum
   ```
2. Update `url` and `sha256` in `Formula/alter.rb`.
3. Commit + push.

`brew update && brew upgrade alter` then resolves the new version.

## License

Apache-2.0.
