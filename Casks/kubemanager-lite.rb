cask "kubemanager-lite" do
    version "1.1.6"
  
    on_arm do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-arm64.zip"
      sha256 "ca1340526cbed38667ce19ba24fd05bf247bd726ff958ab7efc9d2d4c8e093e5"
    end
  
    on_intel do
      url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-v#{version}-macos-amd64.zip"
      sha256 "8c9084cbaa9d08e23fed8c394d4afb10d9afc0e717be3ad64d33e5c761c0ad40"
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