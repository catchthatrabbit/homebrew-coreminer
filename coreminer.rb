require_relative "lib/custom_download_strategy"

class Coreminer< Formula
  desc "Official Coreminer implementation"
  homepage "https://coreblockchain.cc/"
  url "https://github.com/catchthatrabbit/coreminer", :using => :github_private_repo
  version "0.19.29"
  sha256 "72beea23bf7f594eb4e4661ee34bb5c192ac13d4117fac4d92fddd02cce2b572"
  license "LGPL-3.0"

  depends_on "cmake"
  depends_on "git"
  depends_on "make"

  def install
    system "mkdir", "build"
    Dir.chdir('build') do
        system "cmake", ".."
        system "make", "all"
        bin.install Dir["ethminer/ethminer"]
    end
  end
end
