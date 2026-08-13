# typed: false
# frozen_string_literal: true

class GitNanny < Formula
  desc "Cleans up dead local git branches: merged, squash-merged and forgotten"
  homepage "https://github.com/art-ps/git-nanny"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/art-ps/git-nanny/releases/download/v0.1.0/git-nanny_0.1.0_darwin_x86_64.tar.gz"
      sha256 "31fcfafe550612611cab1224dd902107953ed2c9885267932ca4c4cedf6af82f"

      define_method(:install) do
        bin.install "git-nanny"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/art-ps/git-nanny/releases/download/v0.1.0/git-nanny_0.1.0_darwin_arm64.tar.gz"
      sha256 "5dd1cb435fe4ed1e8bb1cca850ed7789fab358779c9bc5874e372dcdbd1a9015"

      define_method(:install) do
        bin.install "git-nanny"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/art-ps/git-nanny/releases/download/v0.1.0/git-nanny_0.1.0_linux_x86_64.tar.gz"
      sha256 "906eb8d52355e6c6a53efcb314e205d25dc0fbfc39cbe56b85063c2482f5a4d7"

      define_method(:install) do
        bin.install "git-nanny"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/art-ps/git-nanny/releases/download/v0.1.0/git-nanny_0.1.0_linux_arm64.tar.gz"
      sha256 "28540b0acbf2b180fd3c34a677f621c27a67202e370bf73035742256697eb11f"

      define_method(:install) do
        bin.install "git-nanny"
      end
    end
  end

  test do
    # Бинарь называется git-nanny, поэтому git подхватывает его как подкоманду.
    system "git", "init", "-q", "-b", "main", testpath
    system "git", "-C", testpath, "commit", "-q", "--allow-empty", "-m", "init"
    assert_match "убирать нечего", shell_output("cd #{testpath} && #{bin}/git-nanny --dry-run")

    system "git", "-C", testpath, "branch", "feature"
    output = shell_output("cd #{testpath} && #{bin}/git-nanny --all-but-default")
    assert_match "feature", output
    assert_match "ничего не удалено", output
  end
end
