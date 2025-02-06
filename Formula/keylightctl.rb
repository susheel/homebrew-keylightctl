class Keylightctl < Formula
  desc "Command line tool for controlling Elgato Key Light devices"
  homepage "https://github.com/endocrimes/keylightctl"
  version "0.0.3"

  on_macos do
    url "https://github.com/endocrimes/keylightctl/releases/download/0.0.3/keylightctl_0.0.3_Darwin_x86_64.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    bin.install "keylightctl"
  end

  test do
    system "#{bin}/keylightctl", "--version"
  end
end
