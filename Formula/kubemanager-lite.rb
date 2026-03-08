# typed: false
# frozen_string_literal: true

class KubemanagerLite < Formula
  desc "Desktop app for real-time Docker container and Kubernetes pod management"
  homepage "https://github.com/guycanella/kubemanager-lite"
  version "1.1.4"
  license "MIT"

  on_linux do
    url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-linux-amd64"
    sha256 "06b33b5e41d031c3b55a5d8bf0765821c32b3a40d8e339911cab3d10ff9d0419"
  end

  def install
    on_linux do
      bin.install "kubemanager_lite-linux-amd64" => "kubemanager-lite"
    end
  end

  test do
    on_linux do
      assert_predicate bin/"kubemanager-lite", :executable?
    end
  end
end