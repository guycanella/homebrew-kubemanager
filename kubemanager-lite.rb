# typed: false
# frozen_string_literal: true

class KubemanagerLite < Formula
    desc "Desktop app for real-time Docker container and Kubernetes pod management"
    homepage "https://github.com/guycanella/kubemanager-lite"
    version "1.1.0"
    license "MIT"
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-arm64.zip"
        sha256 "65ce19b918edac42f1ed746dabaa4bccf24f8af6a8ff4a5b9f15367b57a2c3d5"
      else
        url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-amd64.zip"
        sha256 "1508d14f7f2b3d82c2ea4637aef945aa8326545615548f612b628841183cc67f"
      end
    end
  
    on_linux do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-linux-amd64"
      sha256 "04a91d6e39450a44ad3d2c7845af2114967e75f096f4e65594b72ba5c3c0b43d"
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