require "formula"

class Helios < Formula
  homepage "https://github.com/spotify/helios"
  url "https://oss.sonatype.org/service/local/repositories/releases/content/com/spotify/helios-tools/0.9.175/helios-tools-0.9.175-shaded.jar"
  sha256 "4ade571678edebf252e2b57342773a5450cd4d63b684cab78353c729ed87dd52"
  version "0.9.175"

  depends_on :java => "1.7+"

  def install
    libexec.install "helios-tools-0.9.175-shaded.jar"
    bin.write_jar_script libexec/"helios-tools-0.9.175-shaded.jar", "helios", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
  end

  test do
    system "#{bin}/helios", "--version"
  end
end
