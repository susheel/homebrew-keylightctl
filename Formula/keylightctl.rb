class Keylightctl < Formula
  desc "Command line tool for controlling Elgato Key Light devices"
  homepage "https://github.com/endocrimes/keylightctl"
  version "0.0.3"
  
  on_macos do	
    url "https://github.com/endocrimes/keylightctl/releases/download/0.0.3/keylightctl_0.0.3_Darwin_x86_64.tar.gz"
    sha256 "062948712ccbc995cdaefbd1242b7b5ece7807de8aed8ad775d7466c5c72d5e1"
  end
  
  def install
    bin.install "keylightctl"
  end

  test do
    system "#{bin}/keylightctl", "--version"
  end
end
