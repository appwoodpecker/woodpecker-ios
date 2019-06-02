Pod::Spec.new do |s|

  s.name                        = "WoodpeckerMacOS"
  s.version                     = "1.2.2"
  s.summary                     = "MacOS framework for Woodpekcer"
  s.description                 = "Woodpecker is a handy, powerful Mac app for iOS, MacOS developer, it helps you view, modify sandbox files, monitor network, run javascript in WebView, and more..."
  s.homepage                    = "http://www.woodpeck.cn"
  s.authors                     = { "Woodpecker" => "woodperckerapp@163.com" }
  s.platform                    = :osx, "10.11"
  s.source                      = { :git => "https://github.com/appwoodpecker/woodpecker-ios.git", :tag => "#{s.version}" }
  s.vendored_frameworks         = "WoodpeckerMacOS.framework"
  s.license                     = { :type => 'Copyright', :file => 'LICENSE' }

end
