require "formula"

class Helios < Formula
  homepage "https://github.com/spotify/helios"
  url "https://oss.sonatype.org/service/local/repositories/releases/content/com/spotify/helios-tools/0.9.125/helios-tools-0.9.125-shaded.jar"
  sha256 "39893103d1bf726c9bbd98c27db430af6639c9232b8e927a3f5769e381a83261"
  version "0.9.125"

  depends_on :java => "1.7+"

  def install
    libexec.install "helios-tools-0.9.125-shaded.jar"
    bin.write_jar_script libexec/"helios-tools-0.9.125-shaded.jar", "helios", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
  end

  test do
    system "#{bin}/helios", "--version"
  end
end
