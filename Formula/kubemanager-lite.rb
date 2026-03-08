# typed: false
# frozen_string_literal: true

class KubemanagerLite < Formula
  desc "Desktop app for real-time Docker container and Kubernetes pod management"
  homepage "https://github.com/guycanella/kubemanager-lite"
  version "1.1.5"
  license "MIT"

  on_linux do
    url "https://github.com/guycanella/kubemanager-lite/releases/download/v#{version}/kubemanager_lite-linux-amd64"
    sha256 "3a2fe863bcde07f928f3a1ca972357c5a4c0185db1ae8bd57d5a1fe0c07cf420"
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