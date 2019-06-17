class GitCola < Formula
  desc "Highly caffeinated git GUI"
  homepage "https://git-cola.github.io/"
  url "https://github.com/git-cola/git-cola/archive/v3.4.tar.gz"
  sha256 "763e382d8b32427539585d17ec6fe92026c073f6d31a864a5816ebe22cf245bc"
  head "https://github.com/git-cola/git-cola.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "842138504419457c1a3d5c7419630dcf9b19964c8eeef6f207d271c551f2654e" => :mojave
    sha256 "842138504419457c1a3d5c7419630dcf9b19964c8eeef6f207d271c551f2654e" => :high_sierra
    sha256 "86d77e0c95c30ca1666ba61723acd5a17e6f724cbc356b48137d07a469fc543d" => :sierra
  end

  depends_on "sphinx-doc" => :build
  depends_on "pyqt"
  depends_on "python"

  def install
    ENV.delete("PYTHONPATH")
    system "make", "PYTHON=python3", "prefix=#{prefix}", "install"
    system "make", "install-doc", "PYTHON=python3", "prefix=#{prefix}",
           "SPHINXBUILD=#{Formula["sphinx-doc"].opt_bin}/sphinx-build"
  end

  test do
    system "#{bin}/git-cola", "--version"
  end
end
