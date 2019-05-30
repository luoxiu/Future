Pod::Spec.new do |s|
  s.name             = "FutureQ"
  s.version          = "0.0.1"
  s.license          = { :type => "MIT" }
  s.homepage         = "https://github.com/luoxiu/FutureQ"
  s.author           = { "Quentin Jin" => "jianstm@gmail.com" }
  s.summary          = "Yet another Promise/Future library for Swift"

  s.source           = { :git => "https://github.com/luoxiu/FutureQ.git", :tag => "#{s.version}" }
  s.source_files     = "Sources/FutureQ/**/*.swift"
  
  s.swift_version    = "5.0"

  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.12"
  s.tvos.deployment_target = "10.0"
  s.watchos.deployment_target = "3.0"
end
