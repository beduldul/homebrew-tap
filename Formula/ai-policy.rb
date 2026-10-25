class AiPolicy < Formula
  desc "Check whether a repository accepts AI-assisted contributions"
  homepage "https://github.com/beduldul/ai-policy"
  url "https://github.com/beduldul/ai-policy/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "57c47f6b5374b5b9cb6d13c0edb90f6ff9b62b13c4f8a203255aab0d364a6c96"
  license "MIT"
  head "https://github.com/beduldul/ai-policy.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    (testpath/"CONTRIBUTING.md").write <<~EOS
      # Contributing

      AI-generated pull requests are closed on sight, without review.
    EOS

    # FORBIDDEN exits 20, so the expected status has to be passed explicitly.
    assert_match "FORBIDDEN", shell_output("#{bin}/ai-policy --path #{testpath}", 20)
  end
end
