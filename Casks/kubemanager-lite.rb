cask "kubemanager-lite" do
    version "1.1.5"
  
    on_arm do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-arm64.zip"
      sha256 "55307f696e83b19c947a11e81cb9f543d4e6805e574c7bd988acd5f932c48061"
    end
  
    on_intel do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-amd64.zip"
      sha256 "a2d5f3764193cf82f148c841f6b0e45455c0fb1b222b4a4e4f026977e723cecf"
    end
  
    name "KubeManager Lite"
    desc "Desktop app for real-time Docker container and Kubernetes pod management"
    homepage "https://github.com/guycanella/kubemanager-lite"
  
    on_arm do
        app "kubemanager_lite-macos-arm64.app", target: "#{Dir.home}/Applications/kubemanager_lite-macos-arm64.app"
    end
    
    on_intel do
        app "kubemanager_lite-macos-amd64.app", target: "#{Dir.home}/Applications/kubemanager_lite-macos-amd64.app"
    end
  
    zap trash: [
      "~/Library/Application Support/kubemanager_lite",
      "~/Library/Preferences/kubemanager_lite.plist",
      "~/Library/Caches/kubemanager_lite",
    ]
  end