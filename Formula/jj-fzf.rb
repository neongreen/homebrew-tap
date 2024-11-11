class JjFzf < Formula
  desc "Text UI for Jujutsu based on fzf"
  homepage "https://github.com/tim-janik/jj-fzf"
  url "https://github.com/tim-janik/jj-fzf/archive/refs/tags/v0.22.0.tar.gz"
  sha256 "6f4019423ec9ab93e80b7a4e0883ed6eac526a3a60fb332b937555c9c3f04628"

  head "https://github.com/tim-janik/jj-fzf.git", branch: "trunk"

  depends_on "bash"
  depends_on "fzf"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "jj"

  def install
    bin.install "jj-fzf"
    bin.env_script_all_files libexec, PATH: [
      Formula["gnu-sed"].libexec/"gnubin",
      Formula["gawk"].libexec/"gnubin",
      "$PATH",
    ].join(":")
  end

  test do
    system "jj", "git", "init"
    assert_match "# JJ-FZF", shell_output("#{bin}/jj-fzf --help")
  end
end
