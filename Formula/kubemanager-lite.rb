# typed: false
# frozen_string_literal: true

class KubemanagerLite < Formula
  desc "Desktop app for real-time Docker container and Kubernetes pod management"
  homepage "https://github.com/guycanella/kubemanager-lite"
  version "1.1.3"
  license "MIT"

  on_linux do
    url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-linux-amd64"
    sha256 "5aca5a521ae8cfdf8c350952fb2870098f654c1bc4021a6fc7da4080df46d6f6"
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