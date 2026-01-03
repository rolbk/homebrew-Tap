class Worktimeutil < Formula
  desc "Small CLI tool to read working hours from my calendar, sum them up and push them to absence.io or export them as CSV"
  homepage "https://github.com/EmanuelMairoll/WorkTimeUtil"
  url "https://github.com/EmanuelMairoll/WorkTimeUtil.git", tag: "v2.0.0"
  head "https://github.com/EmanuelMairoll/WorkTimeUtil.git"
  license "MIT"

  depends_on xcode: ["10.0", :build]

  def install
    system "xcodebuild", "-project", "WorkTimeUtil.xcodeproj", "-scheme", "WorkTimeUtil", "-configuration", "Release", "SYMROOT=build"
    bin.install "build/Release/WorkTimeUtil"
    bin.install_symlink "WorkTimeUtil" => "wtc"
    bin.install_symlink "WorkTimeUtil" => "wtp"
    bin.install_symlink "WorkTimeUtil" => "wte"
  end

  test do
    system "false"
  end
end
