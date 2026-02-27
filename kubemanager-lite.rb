# typed: false
# frozen_string_literal: true

class KubemanagerLite < Formula
    desc "Desktop app for real-time Docker container and Kubernetes pod management"
    homepage "https://github.com/guycanella/kubemanager-lite"
    version "1.1.1"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-arm64.zip"
        sha256 "8c88ef50b672ed52f29eb595a21325a7893f9d4a7550e9e802e4e0953eb16117"
      else
        url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-amd64.zip"
        sha256 "aa859f8284a16daab8557bf2255cdf48cb46051a851d7154f0005b9c7810a697"
      end
    end
  
    on_linux do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-linux-amd64"
      sha256 "683da9068662efe2d63e229d52ca7c750eced57f2a4a8fc2ade02e9046314820"
    end
  
    def install
      on_macos do
        app_bundle = Pathname.new(Dir.pwd)
        prefix.install app_bundle
        bin.write_exec_script prefix/app_bundle.basename/"Contents/MacOS/kubemanager_lite"
      end
  
      on_linux do
        bin.install "kubemanager_lite-linux-amd64" => "kubemanager-lite"
      end
    end
  
    def caveats
      on_macos do
        app_name = Dir["#{prefix}/*.app"].first&.split("/")&.last || "kubemanager_lite.app"
        <<~EOS
          KubeManager Lite was installed to:
            #{prefix}/#{app_name}
    
          To add it to your Applications folder:
            ln -s "#{prefix}/#{app_name}" /Applications
    
          If macOS blocks the app on first launch (unsigned binary), run:
            xattr -cr "/Applications/#{app_name}"
        EOS
      end
    end
  
    test do
      # Verify the binary exists and is executable
      on_macos do
        app_bundle = Dir["#{prefix}/*.app"].first
        assert_predicate Pathname.new("#{app_bundle}/Contents/MacOS/kubemanager_lite"), :executable?
      end
      on_linux do
        assert_predicate bin/"kubemanager-lite", :executable?
      end
    end
  end