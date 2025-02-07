class Keylightctl < Formula
  desc "Command line tool for controlling Elgato Key Light devices"
  homepage "https://github.com/eckertalex/keylightctl"
  version "0.1.0"
  
  on_macos do	
    url "https://github.com/eckertalex/keylightctl/releases/download/v0.1.0/keylightctl_Darwin_all.tar.gz"
    sha256 "df77663e5e32c0e9ec485417b8a2c02adb622bef925d6e2c5939ebf3ada7b8b2"
  end
  
  def install
    bin.install "keylightctl"
  end

  test do
    system "#{bin}/keylightctl", "--version"
  end
end
