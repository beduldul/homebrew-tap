cask "ai-policy" do
  version "0.3.0"

  on_arm do
    sha256 "8ddd0d7cb14728b8c2dc14318c4730e295af2a2df4ea9ed1f9c22baee716f0cd"

    url "https://github.com/beduldul/ai-policy/releases/download/v#{version}/ai-policy_darwin_arm64"

    binary "ai-policy_darwin_arm64", target: "ai-policy"
  end
  on_intel do
    sha256 "371902940a61edcbd1f1cc3d80df9ab8e71fd7279df4dbefa78085bf2f40f974"

    url "https://github.com/beduldul/ai-policy/releases/download/v#{version}/ai-policy_darwin_amd64"

    binary "ai-policy_darwin_amd64", target: "ai-policy"
  end

  name "ai-policy"
  desc "Check whether a repository accepts AI-assisted contributions"
  homepage "https://github.com/beduldul/ai-policy"
end
