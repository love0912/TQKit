Pod::Spec.new do |s|
  s.name         = "TQKit"
  s.version      = "0.0.1"
  s.summary      = "A short description of TQKit."
  s.description  = <<-DESC
		TQKit DESC.
                   DESC
  s.homepage     = "http://git.tq-service.com/jason/TQKit"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  # s.license      = "MIT (LICENSE)"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "guojie" => "cqwan.gj@qq.com" }
  
  s.ios.deployment_target = "8.0"
  
  s.source       = { :git => "http://git.tq-service.com/jason/TQKit.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "TQKit/TQKit", "TQKit/TQKit/**/*.{h,m}"
  s.exclude_files = "TQKit/TQKit.xcodeproj"

   # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'QuartzCore'
  s.libraries   = 'sqlite3'

  s.requires_arc = true

end
