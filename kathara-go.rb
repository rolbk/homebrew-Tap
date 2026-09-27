class KatharaGo < Formula
  desc "Container-based network emulator (Go port of Kathara)"
  homepage "https://github.com/rolbk/kathara-go"
  url "https://github.com/rolbk/kathara-go.git", tag: "v3.8.3"
  license "GPL-3.0-only"
  head "https://github.com/rolbk/kathara-go.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %w[-s -w]
    ldflags << "-X main.version=#{version}" if build.stable?
    system "go", "build", *std_go_args(ldflags: ldflags.join(" "), output: bin/"kathara"), "./cmd/kathara"
  end

  def caveats
    <<~EOS
      Kathara uses Docker to create devices and collision domains.
      Install Docker and make sure your user can access its daemon, then run:
        kathara check
    EOS
  end

  test do
    output = shell_output("#{bin}/kathara --version")
    assert_match "Current version:", output
    assert_match version.to_s, output if build.stable?
  end
end
