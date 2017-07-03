//
//  AppInfoUtil.m
//  JKCommunity
//
//  Created by 郭界 on 2017/3/2.
//  Copyright © 2017年 ythd. All rights reserved.
//

#import "AppInfoUtil.h"
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>

@implementation AppInfoUtil

///-------------------------------------
/// @name  app基本信息
///-------------------------------------

/**
 当前app名称
 */
+ (NSString *)appName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
}

/*
 当前app版本号 -- ---用户所见
 1.x.x
 */
+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/**
 用于更新的版本号
 
 @return 1、2、3整数
 */
+ (NSString *)appBundleVerson {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

/**
 build 版本号
 */
+ (NSString *)appBuild {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

/**
 apps 证书编号 (例如MacKun.az.com)
 */
+ (NSString *)appBundleID {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

///--------------------------------------------------------------
/// @name  沙盒缓存大小
///--------------------------------------------------------------

/**
 *  沙盒的路径
 */
+ (NSString *)documentsDirectoryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return documentsPath;
}
/**
 沙盒的内容大小 (例如5 MB)
 */
+ (NSString *)documentsFolderSizeAsString {
    NSString *folderPath = [self documentsDirectoryPath];
    
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    
    unsigned long long int folderSize = 0;
    
    for (NSString *fileName in filesArray) {
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        folderSize += [fileDictionary fileSize];
    }
    
    
    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:folderSize countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}

/**
 沙盒内的字节大小
 */
+ (int)documentsFolderSizeInBytes {
    NSString *folderPath = [self documentsDirectoryPath];
    
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    unsigned long long int folderSize = 0;
    
    for (NSString *fileName in filesArray) {
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        folderSize += [fileDictionary fileSize];
    }
    
    
    return (int)folderSize;
}
/**
 *  程序的大小 包括文件 缓冲 以及 下载
 *
 *  @return  所有文件大小
 */
+ (NSString *)applicationSize {
    unsigned long long docSize   =  [self sizeOfFolder:[self documentPath]];
    unsigned long long libSize   =  [self sizeOfFolder:[self libraryPath]];
    unsigned long long cacheSize =  [self sizeOfFolder:[self cachePath]];
    
    unsigned long long total = docSize + libSize + cacheSize;
    
    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:total countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}

/////---------------------------------------------------------------
///// @name  app 隐私权限
/////---------------------------------------------------------------

/**
 定位权限是否开启
 */
+ (BOOL)isOpenAccessToLocationData {
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusRestricted||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied) {
        return NO;
    }
#if __IPHONE_8_0
#else
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorized)
        return YES;
#endif
    
    return NO;
}

/**
 通讯录访问权限是否开启
 */
+ (BOOL)isOpenAccessToAddressBook {
    BOOL hasAccess = NO;
#if __IPHONE_9_0
    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts]==CNAuthorizationStatusAuthorized) {
        hasAccess=YES;
        
    }
#else
    switch (ABAddressBookGetAuthorizationStatus())
    {
        case kABAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
#endif
    
    return hasAccess;
}

/**
 相机权限是否开启
 */
+ (BOOL)isOpenAccessToCalendar {
    BOOL hasAccess = NO;
    
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent])
    {
        case EKAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
    
    return hasAccess;
}

/**
 推送功能是否开启
 */
+ (BOOL)isOpenAccessToReminders {
    BOOL hasAccess = NO;
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder])
    {
        case EKAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
    
    return hasAccess;
}

/**
 相册权限是否开启
 */
+ (BOOL)isOpenAccessToPhotosLibrary {
    BOOL hasAccess = NO;
    
#if __IPHONE_8_0
    int author = [PHPhotoLibrary authorizationStatus];
    if (author==PHAuthorizationStatusAuthorized) {
        hasAccess=YES;
    }
    
#else
    int author = [ALAssetsLibrary authorizationStatus];
    if(author== ALAuthorizationStatusAuthorized)
    {
        hasAccess=YES;
    }
#endif
    return hasAccess;
}

/**
 *  麦克风开启
 *
 */
+ (void)isOpenAccessToMicrophone:(GrantBlock)flag {
    //检测麦克风功能是否打开
    [[AVAudioSession sharedInstance]requestRecordPermission:^(BOOL granted) {
        
        flag(granted);
        
    }];
}

///-------------------------------------
/// @name  app 相关事件
///-------------------------------------
///**
// *  获取当前视图
// *
// */
+(UIViewController*)getCurrentViewConttoller {
    UIViewController *currentViewController = [self topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    while (currentViewController.presentedViewController) {
        currentViewController = currentViewController.presentedViewController;
    }
    return currentViewController;
}

+ (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    //  Getting topMost ViewController
    while ([topController presentedViewController])	topController = [topController presentedViewController];
    //  Returning topMost ViewController
    return topController;
}

#pragma mark - private
+(unsigned long long)sizeOfFolder:(NSString *)folderPath
{
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *contentsEnumurator = [contents objectEnumerator];
    
    NSString *file;
    unsigned long long folderSize = 0;
    
    while (file = [contentsEnumurator nextObject]) {
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:file] error:nil];
        folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
    }
    return folderSize;
}

+ (NSString *)documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

+ (NSString *)libraryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

+ (NSString *)cachePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}


/**
 拨打电话

 @param phone <#phone description#>
 */
+ (void)callWithPhone:(NSString *)phone {
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",phone];
    NSComparisonResult compare = [[UIDevice currentDevice].systemVersion compare:@"10.0"];
    if (compare == NSOrderedDescending || compare == NSOrderedSame) {
        /// 大于等于10.0系统使用此openURL方法
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone] options:@{} completionHandler:nil];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
#pragma clang diagnostic pop
    }
}

/**
 *  跳到app的评论页
 *
 *  @param appId APP的id号
 */
+ (void)jumpToAppReviewPageWithAppId:(NSString *)appId {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" stringByAppendingString:appId]]];
#pragma clang diagnostic pop
}

/**
 检查是否有版本更新
 
 @param appID AppID
 @param success 回调
 */
+ (void)checkUpdateWithAppID:(NSString *)appID success:(void (^)(NSDictionary *resultDic , BOOL isNewVersion ,NSString * newVersion , NSString *currentVersion, NSError *error))success {
    NSString *url = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@", appID];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *resultDic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        //获取AppStore的版本号
        NSString * versionStr =[[[resultDic objectForKey:@"results"]objectAtIndex:0]valueForKey:@"version"];
        
        NSString *versionStr_int=[versionStr stringByReplacingOccurrencesOfString:@"."withString:@""];
        
        int version=[versionStr_int intValue];
        
        //获取本地的版本号
        NSString * currentVersion = [self appVersion];
        NSString *currentVersion_int=[currentVersion stringByReplacingOccurrencesOfString:@"."withString:@""];
        int current=[currentVersion_int intValue];
        if (success) {
            if(version>current){
                success(resultDic,YES, versionStr,currentVersion, nil);
            }else{
                success(resultDic, NO ,versionStr,currentVersion, nil);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (success) {
            success(nil, NO, nil, nil, error);
        }
    }];
}

/**
 禁止iOS系统进入休眠状态
 */
+ (void)banDormancy {
    [UIApplication sharedApplication].idleTimerDisabled = YES;
}

@end
