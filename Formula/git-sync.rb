class GitSync < Formula
  desc "Sync git refs between remotes without a local checkout"
  homepage "https://github.com/entireio/gitsync"
  url "https://github.com/entireio/gitsync.git",
      using:    :git,
      tag:      "v0.1.0",
      revision: "b83d31d889fcf0533c6980a98cf6e8e47dd4fbae"
  license "MIT"
  head "https://github.com/entireio/gitsync.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/git-sync"
  end

  test do
    assert_predicate bin/"git-sync", :exist?
    assert_predicate bin/"git-sync", :executable?
  end
end
