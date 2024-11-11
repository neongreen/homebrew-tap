class JjFzf < Formula
  homepage "https://github.com/tim-janik/jj-fzf"
  url "https://github.com/tim-janik/jj-fzf/archive/refs/tags/v0.22.0.tar.gz"
  sha256 "6f4019423ec9ab93e80b7a4e0883ed6eac526a3a60fb332b937555c9c3f04628"
  version "0.22.0"

  head "https://github.com/tim-janik/jj-fzf.git", branch: "trunk"

  depends_on "fzf"
  depends_on "jj"
  depends_on "bash"
  depends_on "gnu-sed"
  depends_on "gawk"

  def install
    bin.install "jj-fzf"
    bin.env_script_all_files libexec, PATH: [
      Formula["gnu-sed"].libexec/"gnubin",
      Formula["gawk"].libexec/"gnubin",
      "$PATH"
    ].join(":")
  end
end
