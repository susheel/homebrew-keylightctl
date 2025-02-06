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


class Keylightctl < Formula
  desc "Command line tool for controlling Elgato Key Light devices"
  homepage "https://github.com/endocrimes/keylightctl"
  version "0.0.3"
  
  # Source URL for building from source when bottles aren't available
  url "https://github.com/endocrimes/keylightctl/archive/refs/tags/0.0.3.tar.gz"
  sha256 "7fd78d3b5253af0750c2efbc58c0cd5895378e2e0c4cf22e07b0d90dad09a646"

  # Required for building from source
  depends_on "go" => :build

  # Bottle configuration
  bottle do
    root_url "https://github.com/endocrimes/keylightctl/releases/download/0.0.3"
    sha256 x86_64_linux: "2e671f775b60e1cac8468d5a43a69b7f1f060ac8073f93f2c8196e0cd6cb594e"
    sha256 x86_64_macos: "062948712ccbc995cdaefbd1242b7b5ece7807de8aed8ad775d7466c5c72d5e1"
    sha256 arm64_macos: "062948712ccbc995cdaefbd1242b7b5ece7807de8aed8ad775d7466c5c72d5e1"
    sha256 intel_linux: "cfa73fec729450cf4f2c441944fdeff4241b8a5e658e358b64b9cbba32c2212e"
  end

  def install
    if build.bottle?
      # Install from bottle (pre-built binary)
      bin.install "keylightctl"
    else
      # Build from source for unsupported architectures
      system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
    end
  end

  # Map bottle filenames to release artifacts
  def bottle_filename
    platform = OS.mac? ? "Darwin" : "Linux"
    arch = case
    when OS.mac? && Hardware::CPU.intel?
      "x86_64"
    when OS.mac? && Hardware::CPU.arm?
      "x86_64" # Using x86_64 binary for ARM via Rosetta
    when OS.linux? && Hardware::CPU.intel?
      Hardware::CPU.is_64_bit? ? "x86_64" : "i386"
    else
      "unsupported"
    end
    
    "keylightctl_#{version}_#{platform}_#{arch}.tar.gz"
  end

  test do
    # Version test
    assert_match "keylightctl v0.0.1-dev", shell_output("#{bin}/keylightctl version")
  end
end
