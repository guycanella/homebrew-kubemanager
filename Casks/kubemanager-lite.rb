cask "kubemanager-lite" do
    version "1.1.4"
  
    on_arm do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-arm64.zip"
      sha256 "f6d92ab7a6064ba4bb7055cd1eba90efad3da3cb03da0ee79596e4fcc584ee68"
    end
  
    on_intel do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-amd64.zip"
      sha256 "6baa90215b637dd094f333495565d97f8d8d9bf4767f3547f571242ced4a62be"
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