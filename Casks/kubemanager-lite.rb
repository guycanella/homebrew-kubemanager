cask "kubemanager-lite" do
    version "1.1.3"
  
    on_arm do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-arm64.zip"
      sha256 "4a49cbb2e2933c3bc9881ebb90687b74eff0914cf09159ab75db31722bb13d55"
    end
  
    on_intel do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-amd64.zip"
      sha256 "18b2ef2fdc796ab29792aca8fe1650c8d3e3266dea779603519e4b16ba4de6b4"
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