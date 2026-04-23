# Homebrew Formula scaffold for @truealter/cli.
#
# Destination: true-alter/homebrew-tap:Formula/alter.rb (the tap repo
# does not exist yet; create it when flipping alter-cli public).
#
# Post-publish flow:
#   1. Compute the tarball SHA256:
#        curl -fsSL https://registry.npmjs.org/@truealter/cli/-/cli-<ver>.tgz \
#          | sha256sum
#      (or read the `integrity` field from
#      https://registry.npmjs.org/@truealter/cli/<ver> and decode
#      the base64-encoded sha512 -- sha256 is preferred for Formula).
#   2. Update the `url` + `sha256` below for the released version.
#   3. Commit to the tap repo. `brew install truealter/tap/alter` then
#      resolves against the new Formula.
#
# `std_npm_args` requires Homebrew >= 4.0 and handles node dependency
# resolution + PATH setup. `bin.install_symlink` exposes `alter` on
# $PATH via the Homebrew prefix.

class Alter < Formula
  desc "ALTER identity CLI -- login once, authenticated everywhere"
  homepage "https://truealter.com"
  url "https://registry.npmjs.org/@truealter/cli/-/cli-0.2.1.tgz"
  sha256 "560f9da8cb6eb46f26c65b4d8c680b2da707f1daf70625a6940020cddd02b5a4"
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
