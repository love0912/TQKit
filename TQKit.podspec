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
  
  s.source       = { :git => "https://github.com/love0912/TQKit.git", :tag => "0.0.2" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "TQKit/TQKit/**/*"
  s.exclude_files = "TQKit/TQKit.xcodeproj"

   # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'QuartzCore'
  s.libraries   = 'sqlite3', 'z'
  s.public_header_files = 'TQKit/TQKit/**/*.h'

  s.requires_arc = true

    s.subspec '3rdLib' do |ss|
        ss.subspec 'AFNetworking' do |sss|
            sss.source_files = 'TQKit/TQKit/3rdLib/AFNetworking/*'
        end

        ss.subspec 'YYCache' do |sss1|
            sss1.source_files = 'TQKit/TQKit/3rdLib/YYCache/*'
        end
    end

    s.subspec 'Category' do |ss|
        ss.public_header_files = 'TQKit/TQKit/Category/YYCategoriesMacro.h'
        ss.source_files = 'TQKit/TQKit/Category/YYCategoriesMacro.h'
            ss.subspec 'Foundation' do |sss|
            #sss.source_files = 'TQKit/TQKit/Category/Foundation/TT_FoundationHeader.h'

            sss.subspec 'NSData' do |ssss|
            ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSData/*'
            end

        end
    end

end
