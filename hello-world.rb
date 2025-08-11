class HelloWorld < Formula
    desc "bunny.net Hello World"
    homepage "https://bunny.net/"
    license "MIT"
    url "https://github.com/rafael-at-bunny/hello-world.git",
        tag:      "v0.0.1",
        revision: "021c3b4f8672da2b13c5b9fafa25bc50f7fb15ee"
    head "https://github.com/rafael-at-bunny/hello-world.git", branch: "main"

    bottle do
        root_url "https://homebrew-tap-test.b-cdn.net"
        rebuild 1
        sha256 cellar: :any_skip_relocation, arm64_sequoia: "469f89926c8f42dd64cef164ef8ccef38672139dfc251098abbd1ff2c2fecf52"
    end

    depends_on "go" => :build

    def install
        ldflags = "-s -w -X main.version=#{version}"
        system "go", "build", *std_go_args(ldflags:)
    end
end
