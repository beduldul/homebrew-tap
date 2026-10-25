class AiPolicy < Formula
  desc "Check whether a repository accepts AI-assisted contributions"
  homepage "https://github.com/beduldul/ai-policy"
  url "https://github.com/beduldul/ai-policy/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d21d8d6c5bb0caed86b3ca5f0239d36b3d1697462034a05fae38a6657330c58e"
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
