class Keylightctl < Formula
  desc "Command line tool for controlling Elgato Key Light devices"
  homepage "https://github.com/endocrimes/keylightctl"
  version "v0.0.3"

  if OS.mac?
    url "https://github.com/endocrimes/keylightctl/archive/refs/tags/0.0.3.tar.gz" # Update URL with the latest release
    sha256 "7fd78d3b5253af0750c2efbc58c0cd5895378e2e0c4cf22e07b0d90dad09a646"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "#{bin}/keylightctl", "--version"
  end
end
