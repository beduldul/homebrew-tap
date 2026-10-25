class AiPolicy < Formula
  desc "Check whether a repository accepts AI-assisted contributions"
  homepage "https://github.com/beduldul/ai-policy"
  version "0.2.1"
  license "MIT"

  # Prebuilt binaries, so installing does not drag in a Go toolchain. Only the
  # platform differs between them; the install step renames whichever arrived.
  on_macos do
    on_arm do
      url "https://github.com/beduldul/ai-policy/releases/download/v0.2.1/ai-policy_darwin_arm64"
      sha256 "9a7d3337e89c9868f18370173493ac85f483356e7804d2520a5e7bf13053d804"
    end

    on_intel do
      url "https://github.com/beduldul/ai-policy/releases/download/v0.2.1/ai-policy_darwin_amd64"
      sha256 "d94eecb9d976f05895ef82822c2401691271029608b452595952f04f757f439d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beduldul/ai-policy/releases/download/v0.2.1/ai-policy_linux_arm64"
      sha256 "f6fe6e15e550b3129da855d3ab86ba647058c6cab08f138f33ebd2e12f9ba802"
    end

    on_intel do
      url "https://github.com/beduldul/ai-policy/releases/download/v0.2.1/ai-policy_linux_amd64"
      sha256 "c6bb6e0ec69d27701697423f9f9c33d53a878974eae7f22c19fc337a19a2fe13"
    end
  end

  def install
    bin.install Dir["ai-policy_*"].first => "ai-policy"
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
