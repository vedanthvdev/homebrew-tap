class GitPulse < Formula
  include Language::Python::Virtualenv

  desc "Background Git repository updater — keeps your default branches fresh"
  homepage "https://github.com/vedanthvdev/git-pulse"
  url "https://github.com/vedanthvdev/git-pulse/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "009b3cdbd754b24aa88d7faf38ae1805d74b281abe82830aaaa3486213e92805"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--no-cache-dir",
           "typer>=0.9", "rich>=13", "pyyaml>=6", "gitpython>=3.1", "shellingham>=1.5"
    system libexec/"bin/pip", "install", "--no-cache-dir", "--no-deps", buildpath
    bin.install_symlink Dir[libexec/"bin/git-pulse"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-pulse --version")
  end
end
