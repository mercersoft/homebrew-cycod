class Cycod < Formula
  desc "CYCODEV is an AI-powered CLI toolset that brings the power of large language models to your command line interface. With CYCODEV, you can chat with AI models, create and manage custom prompts, save conversation history, and much more."
  homepage "https://cycoddocs100.z13.web.core.windows.net/"
  
  # The URL to the tarball or zip of your tool's source code.
  # Replace '1.0.0' with the actual version number.
  url "https://github.com/mercersoft/cycod/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e49798243379383c04c83aea43d817295a70b23c56ccda7d0338c25009b90835"
  
  # Declare the dependency on the .NET SDK.
  depends_on "dotnet"

  def install
    # These commands are executed by Homebrew to build and install your tool.
    # `buildpath` is a Homebrew variable that points to the directory where the source code was downloaded.
    # Change `foo/cycod.csproj` to the actual path of your project file relative to the root of your source code.
    system "dotnet", "build", "src/cycod/cycod.csproj", "--configuration", "Release", "--output", "build_output"
  
    # The 'dotnet' command is now available because of the 'depends_on' line.
    # The 'cycod' tool must be installed as a global tool.
    system "dotnet", "tool", "install", "--global", "cycod", "--version", "1.0.0"

    # The installation directory is accessible via 'prefix'.
    # This creates a symlink to the installed tool in Homebrew's bin directory.
    # The location of global tools is typically in the user's home directory under .dotnet/tools.
    bin.install_symlink Dir["~/.dotnet/tools/cycod"]
  end

  test do
    # This block runs a test to ensure the tool installed correctly.
    # Replace `cycod --version` with a command that works for your tool.
    assert_match "cycod", shell_output("#{bin}/cycod --version")
  end
end