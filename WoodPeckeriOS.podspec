Pod::Spec.new do |s|


  s.name         = "WoodPeckeriOS"
  s.version      = "1.0.0"
  s.summary      = "iOS client framework for WoodPekcer Mac App"
  s.description  = "iOS client framework for WoodPekcer Mac App"
  s.homepage     = "http://www.woodpeck.cn"
  s.authors            = { "xiaogang zhang" => "2767577447@qq.com" }
  # s.social_media_url   = "http://twitter.com/张小刚"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/github-xiaogang/woodpeckeriOS.git", :tag => "#{s.version}" }
  s.source_files  = ""
  s.vendored_frameworks = "WoodPeckeriOS.framework"  


end
