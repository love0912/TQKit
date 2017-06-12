Pod::Spec.new do |s|
  s.name         = "TQKit"
  s.version      = "0.0.2"
  s.summary      = "TQKit is iOS TQ Project"
  s.description  = <<-DESC
		TQKit is iOS TQ Project .Private.
                   DESC
  s.homepage     = "https://github.com/love0912/TQKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "guojie" => "cqwan.gj@qq.com" }
  
  s.ios.deployment_target = "8.0"
  
  s.source       = { :git => "https://github.com/love0912/TQKit.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = 'TQKit/TQKit/TQKit.h'
  s.exclude_files = "TQKit/TQKit.xcodeproj"

   # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'QuartzCore'
  s.libraries   = 'sqlite3', 'z'

  s.requires_arc = true


s.subspec 'Core' do |ss|
ss.source_files = 'TQKit/TQKit/Core/Action/**/*'
ss.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'QuartzCore'
ss.libraries   = 'sqlite3', 'z'
ss.dependency 'AFNetworking', '~> 3.1.0'
end

end
