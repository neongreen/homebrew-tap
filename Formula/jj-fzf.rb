class JjFzf < Formula
  desc "Text UI for Jujutsu based on fzf"
  homepage "https://github.com/tim-janik/jj-fzf"
  url "https://github.com/tim-janik/jj-fzf/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "2d31959743affabaac7eadba056b8e41c32050ff895c116529c004491f3136c8"

  head "https://github.com/tim-janik/jj-fzf.git", branch: "trunk"

  depends_on "bash"
  depends_on "fzf"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "jj"

  def install
    bin.install "jj-fzf"
    # https://github.com/tim-janik/jj-fzf/issues/2
    bin.env_script_all_files libexec, PATH: [
      Formula["gnu-sed"].libexec/"gnubin",
      "$PATH",
    ].join(":")
  end

  test do
    system "jj", "git", "init"
    assert_match "# JJ-FZF", shell_output("#{bin}/jj-fzf --help")
  end
end
