cask "kubemanager-lite" do
    version "1.1.2"
  
    on_arm do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-arm64.zip"
      sha256 "PLACEHOLDER_SHA256_MACOS_ARM64"
    end
  
    on_intel do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-amd64.zip"
      sha256 "PLACEHOLDER_SHA256_MACOS_AMD64"
    end
  
    name "KubeManager Lite"
    desc "Desktop app for real-time Docker container and Kubernetes pod management"
    homepage "https://github.com/guycanella/kubemanager-lite"
  
    on_arm do
      app "kubemanager_lite-macos-arm64.app"
    end
  
    on_intel do
      app "kubemanager_lite-macos-amd64.app"
    end
  
    zap trash: [
      "~/Library/Application Support/kubemanager_lite",
      "~/Library/Preferences/kubemanager_lite.plist",
      "~/Library/Caches/kubemanager_lite",
    ]
  end