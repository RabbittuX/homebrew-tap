class Purrge < Formula
  desc "AI-powered disk space manager using Claude Code, Codex, WorkBuddy or DeepSeek"
  homepage "https://github.com/RabbittuX/purrge"
  url "https://github.com/RabbittuX/purrge/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "a879c104d2993016f7e64416327ab2a046a847bf3c9c65096e54e1a160e4b8d7"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"runtime/bin/purrge"
  end

  def caveats
    <<~EOS
      首次安装：运行以下命令完成设置（选择 AI 引擎、设置提醒阈值并启用后台监控）：
        purrge install

      从旧版本升级：运行以下命令，把后台程序同步到新版本（设置和 AI 引擎都保留）：
        purrge update
    EOS
  end

  test do
    assert_match "purrge", shell_output("#{bin}/purrge 2>&1")
  end
end
