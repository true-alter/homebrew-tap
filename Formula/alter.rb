# Homebrew Formula for @truealter/cli.
#
# Source of truth: this file. The scaffold copy at
# `true-alter/alter-cli:packaging/homebrew/Formula/alter.rb` is a staging
# area kept in step with this Formula via a sync commit per release.
#
# Post-publish flow (per release):
#   1. Compute the tarball SHA256:
#        curl -fsSL https://registry.npmjs.org/@truealter/cli/-/cli-<ver>.tgz \
#          | sha256sum
#      (or read the `integrity` field from
#      https://registry.npmjs.org/@truealter/cli/<ver> and decode
#      the base64-encoded sha512 — sha256 is preferred for Formula).
#   2. Update the `url` + `sha256` below for the released version.
#   3. Commit to this tap repo. `brew install truealter/tap/alter` then
#      resolves against the new Formula on the next `brew update`.
#
# `std_npm_args` requires Homebrew >= 4.0 and handles node dependency
# resolution + PATH setup. `bin.install_symlink` exposes `alter` on
# $PATH via the Homebrew prefix.

class Alter < Formula
  desc "ALTER identity CLI -- login once, authenticated everywhere"
  homepage "https://truealter.com"
  url "https://registry.npmjs.org/@truealter/cli/-/cli-0.7.0.tgz"
  sha256 "187ebe653fdb9075b7d4d5d26fc903ed6c340f3eed0ea7c68495b2bffaf031ad"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "alter", shell_output("#{bin}/alter --help")
  end
end
