cask "ai-policy" do
  version "0.2.1"

  on_arm do
    sha256 "9a7d3337e89c9868f18370173493ac85f483356e7804d2520a5e7bf13053d804"
    url "https://github.com/beduldul/ai-policy/releases/download/v#{version}/ai-policy_darwin_arm64"
  end

  on_intel do
    sha256 "d94eecb9d976f05895ef82822c2401691271029608b452595952f04f757f439d"
    url "https://github.com/beduldul/ai-policy/releases/download/v#{version}/ai-policy_darwin_amd64"
  end

  name "ai-policy"
  desc "Check whether a repository accepts AI-assisted contributions"
  homepage "https://github.com/beduldul/ai-policy"

  on_arm do
    binary "ai-policy_darwin_arm64", target: "ai-policy"
  end

  on_intel do
    binary "ai-policy_darwin_amd64", target: "ai-policy"
  end
end
