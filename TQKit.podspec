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
  
  s.source       = { :git => "https://github.com/love0912/TQKit.git", :tag => "0.0.2", :submodules => true }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

#s.source_files  = "TQKit/TQKit/TQKit.h"
  s.exclude_files = "TQKit/TQKit.xcodeproj"

   # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'QuartzCore'
  s.libraries   = 'sqlite3', 'z'

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
        ss.public_header_files = 'TQKit/TQKit/Category/TT_CategoryHeader.h'
        ss.source_files = 'TQKit/TQKit/Category/*.h'
            ss.subspec 'Foundation' do |sss|
            #sss.source_files = 'TQKit/TQKit/Category/Foundation/TT_FoundationHeader.h'

            sss.subspec 'NSData' do |ssss|
                ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSData/*'
            end
            sss.subspec 'NSDate' do |ssss|
                ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSDate/*'
            end
            sss.subspec 'NSDictionary' do |ssss|
                ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSDictionary/*'
            end
            sss.subspec 'NSNumber' do |ssss|
                ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSNumber/*'
            end
            sss.subspec 'NSObject' do |ssss|
                ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSObject/*'
            end
            sss.subspec 'NSString' do |ssss|
                ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSString/*'
            end
            sss.subspec 'NSTimer' do |ssss|
                ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSTimer/*'
            end
            sss.subspec 'NSUserDefaults' do |ssss|
                ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSUserDefaults/*'
            end
        end
    end

end
