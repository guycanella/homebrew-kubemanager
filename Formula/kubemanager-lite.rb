# typed: false
# frozen_string_literal: true

class KubemanagerLite < Formula
  desc "Desktop app for real-time Docker container and Kubernetes pod management"
  homepage "https://github.com/guycanella/kubemanager-lite"
  version "1.1.2"
  license "MIT"

  on_linux do
    url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-linux-amd64"
    sha256 "5a5ec088cdaa845983dcbc3faa8e91448919e3a1277cc2f3bf41ae0ff8afd3f1"
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