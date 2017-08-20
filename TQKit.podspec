Pod::Spec.new do |s|
  s.name         = "TQKit"
  s.version      = "2.0.1"
  s.summary      = "TQKit is iOS TQ Project"
  s.description  = <<-DESC
		新增去除字符串所有空格的方法，新增获取网络时间的方法
                   DESC
  s.homepage     = "https://github.com/love0912/TQKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "guojie" => "cqwan.gj@qq.com" }
  
  s.ios.deployment_target = "8.0"
  
s.source       = { :git => "https://github.com/love0912/TQKit.git", :tag => "#{s.version}"}


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "TQKit/TQKit/TQKit.h"
  s.exclude_files = "TQKit/TQKit.xcodeproj"

   # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'QuartzCore', 'SystemConfiguration'
  s.libraries   = 'sqlite3', 'z'

  s.requires_arc = true

#  s.subspec '3rdLib' do |ss|
#  ss.dependency 'TQKit/Category'
# ss.subspec 'AFNetworking' do |sss|
#  sss.source_files = 'TQKit/TQKit/3rdLib/AFNetworking/*'
#end

#ss.subspec 'YYCache' do |sss1|
#     sss1.source_files = 'TQKit/TQKit/3rdLib/YYCache/*'
#  end
# end

    s.subspec 'Category' do |ss|
        ss.source_files = 'TQKit/TQKit/Category/*.h'
        ss.dependency 'YYCache', '~> 1.0.4'
            ss.subspec 'Foundation' do |sss|
                sss.source_files = 'TQKit/TQKit/Category/Foundation/TT_FoundationHeader.h'
                sss.subspec 'NSData' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSData/*'
                end
                sss.subspec 'NSDate' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSDate/*'
                end
                sss.subspec 'NSDictionary' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSDictionary/*'
                end
                sss.subspec 'NSObject' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSObject/*'
                end
                sss.subspec 'NSNumber' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSNumber/*'
                    ssss.dependency 'TQKit/Category/Foundation/NSData'
                end
                sss.subspec 'NSString' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSString/*'
                    ssss.dependency 'TQKit/Category/Foundation/NSNumber'
                end
                sss.subspec 'NSTimer' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSTimer/*'
                end
                sss.subspec 'NSUserDefaults' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/Foundation/NSUserDefaults/*'
                end
            end

            ss.subspec 'Quartz' do |sss|
                sss.source_files = 'TQKit/TQKit/Category/Quartz/*'
            end

            ss.subspec 'UIKit' do |sss|
                sss.source_files = 'TQKit/TQKit/Category/UIKit/TT_UIKitHeader.h'
                sss.subspec 'UIApplication' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIApplication/*'
                    ssss.dependency 'TQKit/Category/UIKit/UIDevice'
                end
                sss.subspec 'UIBarButtonItem' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIBarButtonItem/*'
                end
                sss.subspec 'UIBezierPath' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIBezierPath/*'
                    ssss.dependency 'TQKit/Category/UIKit/UIFont'
                end
                sss.subspec 'UIButton' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIButton/*'
                end
                sss.subspec 'UIColor' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIColor/*'
                end
                sss.subspec 'UIControl' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIControl/*'
                end
                sss.subspec 'UIDevice' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIDevice/*'
                    ssss.dependency 'TQKit/Category/Foundation/NSString'
                end
                sss.subspec 'UIFont' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIFont/*'
                end
                sss.subspec 'UIGesture' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIGesture/*'
                end
                sss.subspec 'UIImage' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIImage/*'
                    ssss.dependency 'TQKit/Category/YYUtils'
                end
                sss.subspec 'UIImageView' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIImageView/*'
                end
                sss.subspec 'UINavigationBar' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UINavigationBar/*'
                end
                sss.subspec 'UINavigationController' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UINavigationController/*.{h,m}'
                end
                sss.subspec 'UIScrollView' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIScrollView/*'
                end
                sss.subspec 'UITableView' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UITableView/*'
                end
                sss.subspec 'UITextField' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UITextField/*'
                end
                sss.subspec 'UITextView' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UITextView/*'
                end
                sss.subspec 'UIView' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIView/*'
                end
                sss.subspec 'UIViewController' do |ssss|
                    ssss.source_files = 'TQKit/TQKit/Category/UIKit/UIViewController/*'
                end
            end

            ss.subspec 'YYUtils' do |sss|
                sss.source_files = 'TQKit/TQKit/Category/YYUtils/*'
                sss.dependency 'TQKit/Category/UIKit/UIView'
            end
    end

    s.subspec 'Macros' do |ss|
        ss.source_files = 'TQKit/TQKit/Macros/*.h'
        ss.dependency 'TQKit/Category'
    end

    s.subspec 'Utils' do |ss|
        ss.source_files = 'TQKit/TQKit/Utils/TT_Utils_Header.h'
        ss.dependency 'TQKit/Macros'
        ss.subspec 'TTAlertUtil' do |sss|
            sss.source_files = 'TQKit/TQKit/Utils/TTAlertUtil/*'
            sss.dependency 'TQKit/Category/Foundation/NSString'
        end
        ss.subspec 'TTProgressHUD' do |sss|
        sss.source_files = 'TQKit/TQKit/Utils/TTProgressHUD/*.{h,m}'
            sss.dependency 'SVProgressHUD', '~> 2.1.2'
        end
        ss.subspec 'AppInfoUtil' do |sss|
            sss.source_files = 'TQKit/TQKit/Utils/AppInfoUtil/*'
            sss.dependency 'AFNetworking', '~> 3.1.0'
        end
        ss.subspec 'TTQRCodeUtil' do |sss|
            sss.source_files = 'TQKit/TQKit/Utils/TTQRCodeUtil/*'
        end
        ss.subspec 'TTTableViewUtil' do |sss|
            sss.source_files = 'TQKit/TQKit/Utils/TTTableViewUtil/*'
        end
        ss.subspec 'UserInfoUtil' do |sss|
            sss.source_files = 'TQKit/TQKit/Utils/UserInfoUtil/*'
            sss.dependency 'TQKit/Core/Action/Constants'
        end

    end

    s.subspec 'Core' do |ss|
        ss.dependency 'AFNetworking', '~> 3.1.0'
        ss.subspec 'Action' do |sss|

            sss.subspec 'Reachability' do |ssss|
            ssss.source_files = 'TQKit/TQKit/Core/Action/Reachability/*.{h,m}'
            ssss.dependency 'TQKit/Utils'
            end

            sss.subspec 'Constants' do |ssss|
            ssss.source_files = 'TQKit/TQKit/Core/Action/Constants/*.{h,m}'
            end

            sss.subspec 'Actions' do |ssss|
            ssss.source_files = 'TQKit/TQKit/Core/Action/Actions/*.{h,m}'
            ssss.dependency 'TQKit/Core/Action/Reachability'
            end
        end
        ss.subspec 'Service' do |sss|
            sss.source_files = 'TQKit/TQKit/Core/Service/*.{h,m}'
            sss.dependency 'TQKit/Core/Action'
        end
        ss.subspec 'TTMediator' do |sss|
            sss.source_files = 'TQKit/TQKit/Core/TTMediator/*.{h,m}'
            sss.dependency 'TQKit/Category/Foundation/NSString'
        end
    end

    s.subspec 'Component' do |ss|
        ss.source_files = 'TQKit/TQKit/Component/TT_ComponetHeader.h'
        ss.subspec 'TTBanner' do |sss|
            sss.source_files = 'TQKit/TQKit/Component/TTBanner/*'
        end
        ss.subspec 'TTQRCodeScan' do |sss|
            sss.source_files = 'TQKit/TQKit/Component/TTQRCodeScan/*.{h,m}'
            sss.frameworks = 'AVFoundation'
        end
    end
end
