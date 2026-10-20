class Purrge < Formula
  desc "AI-powered disk space manager for macOS, using Claude Code or Codex"
  homepage "https://github.com/RabbittuX/purrge"
  url "https://github.com/RabbittuX/purrge/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "59c2cb76efd01215f77ce24aa59d5ea1225819aa270d897b0d2c3d701d4ba538"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"runtime/bin/purrge"
  end

  def caveats
    <<~EOS
      运行以下命令完成设置（选择 AI 引擎、设置提醒阈值并启用后台监控）：
        purrge install
    EOS
  end

  test do
    assert_match "purrge", shell_output("#{bin}/purrge 2>&1")
  end
end
