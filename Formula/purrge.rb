class Purrge < Formula
  desc "AI-powered disk space manager for macOS, using Claude Code or Codex"
  homepage "https://github.com/RabbittuX/purrge"
  url "https://github.com/RabbittuX/purrge/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "f71e587f489480a2fa819035d0deebaeeaef807196cdd83d1524984f5261a0cf"
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
