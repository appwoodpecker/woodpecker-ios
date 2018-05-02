Pod::Spec.new do |s|

  s.name                        = "WoodPeckeriOS"
  s.version                     = "1.0.6"
  s.summary                     = "iOS framework for WoodPekcer Mac App"
  s.description                 = "WoodPecker is a handy, powerful Mac app for iOS developer, it helps you view, modify sandbox files, monitor network, run javascript in WebView, and more..."
  s.homepage                    = "http://www.woodpeck.cn"
  s.authors                     = { "WoodPecker" => "woodperckerapp@163.com" }
  s.platform                    = :ios, "8.0"
  s.source                      = { :git => "https://github.com/github-xiaogang/woodpeckeriOS.git", :tag => "#{s.version}" }
  s.vendored_frameworks         = "WoodPeckeriOS.framework"
  s.license                     = { :type => 'Copyright', :file => 'LICENSE' }

end
