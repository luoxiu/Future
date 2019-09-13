Pod::Spec.new do |s|
  s.name             = "Future.swift"
  s.module_name      = "Future"
  s.version          = "0.0.1"
  s.license          = { :type => "MIT" }
  s.homepage         = "https://github.com/luoxiu/Future"
  s.author           = { "Quentin Jin" => "luoxiustm@gmail.com" }
  s.summary          = "Future is an implementation of futures and promises for Swift."

  s.source           = { :git => "https://github.com/luoxiu/Future.git", :tag => "#{s.version}" }
  s.source_files     = "Sources/Future/**/*.swift"
  
  s.swift_version    = "5.0"

  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.12"
  s.tvos.deployment_target = "10.0"
  s.watchos.deployment_target = "3.0"
end
