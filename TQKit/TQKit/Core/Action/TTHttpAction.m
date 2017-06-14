//
//  TTHttpAction.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "TTHttpAction.h"
#import "TTAPIClient.h"
#import "TTProgressHUD.h"
#import "TT_CategoryHeader.h"
#import "YYCache.h"
#import <math.h>

#define kSignSaltStarIndex 7
#define kSignSaltLength 3
#define kSigntureKey @"TQSignature"


typedef enum : NSUInteger {
    Http_Post,
    Http_Get,
} HttpMethodType;

@interface TTHttpAction ()
@property (nonatomic, strong) NSMutableArray *arr_sessionTask;

@property (nonatomic, strong) TTAPIClient *apiClient;

@property (nonatomic, strong) YYCache *cache;

@end

static NSString *TTCacheName = @"TTAPICache";

@implementation TTHttpAction

+ (instancetype)sharedHttpAction {
    static TTHttpAction *_sharedAction = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAction = [[TTHttpAction alloc] init];
    });
    return _sharedAction;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _apiClient = [TTAPIClient sharedClient];
        _cache = [YYCache cacheWithName:TTCacheName];
    }
    return self;
}

- (BOOL)isReachable {
    return _apiClient.isReachable;
}


#pragma mark - 网络请求方法

/**
 *  普通的访问请求(有提示，带判断网络状态, 带loading..)
 *
 *  @param URLString    接口地址
 *  @param requestBlock 回调函数
 */
- (void)POSTHUDByUrlString:(NSString *)URLString result:(ResultBlock)requestBlock {
    [self POSTHUDByUrlString:URLString parameters:nil result:requestBlock];
}

/**
 *  普通的访问请求(有提示，带判断网络状态)
 *
 *  @param URLString    接口地址
 *  @param requestBlock 回调函数
 */
- (void)POSTByUrlString:(NSString *)URLString result:(ResultBlock)requestBlock {
    [self POSTByUrlString:URLString parameters:nil result:requestBlock];
}

/**
 *  普通的访问请求(有提示，带判断网络状态, 带loading..)
 *
 *  @param URLString    接口地址
 *  @param parameters   字典参数
 *  @param requestBlock 回调函数
 */
- (void)POSTHUDByUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock {
    [self httpByUrlString:URLString methodType:Http_Post parameters:parameters isShowHUD:YES result:requestBlock];
}

/**
 *  普通的访问请求(有提示，带判断网络状态)
 *
 *  @param URLString    接口地址
 *  @param parameters   字典参数
 *  @param requestBlock 回调函数
 */
- (void)POSTByUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock {
    [self httpByUrlString:URLString methodType:Http_Post parameters:parameters isShowHUD:NO result:requestBlock];
}

/**
 *  普通的访问请求(有提示，带判断网络状态, 带loading)
 *
 *  @param URLString    接口地址
 *  @param parameters   字典参数
 *  @param requestBlock 回调函数
 */
- (void)GETHUDByUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock {
    [self httpByUrlString:URLString methodType:Http_Get parameters:parameters isShowHUD:YES result:requestBlock];
}

/**
 *  普通的访问请求(有提示，带判断网络状态)
 *
 *  @param URLString    接口地址
 *  @param parameters   字典参数
 *  @param requestBlock 回调函数
 */
- (void)GETByUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock {
    [self httpByUrlString:URLString methodType:Http_Get parameters:parameters isShowHUD:NO result:requestBlock];
}

/**
 获取html代码
 
 @param URLString html连接
 @param requestBlock 回调函数
 */
- (void)getHtmlStringOfURLString:(NSString *)URLString result:(ResultBlock)requestBlock {
    [TTProgressHUD showFlatLoading];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URLString parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (requestBlock) {
            NSString *dataString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            requestBlock(APIReturnCodeSuccess, dataString, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self failResponseError:error result:requestBlock];
    }];
}

#pragma mark - private
/**
 Http访问请求
 
 @param URLString 接口地址
 @param methodType post get 类型
 @param parameters 参数
 @param isShowHUD 是否显示loading
 @param requestBlock 回调函数
 */
- (void)httpByUrlString:(NSString *)URLString methodType:(HttpMethodType)methodType parameters:(id)parameters isShowHUD:(BOOL)isShowHUD result:(ResultBlock)requestBlock {
    if (self.isReachable){
        if (isShowHUD) {
            [TTProgressHUD showFlatLoading];
        }
#warning 缓存策略，还需更加精细,暂时注释
//        NSString *cache_key = [self cacheKeyWithUrlString:URLString parameters:parameters];
//        id data = [_cache objectForKey:cache_key];
//        if (data) {
//            requestBlock([data[APIReturnCode] integerValue], data[APIReturnData], nil);
//        }
        NSURLSessionDataTask *task = nil;
        if (methodType == Http_Post) {
            task = [self postWithUrlString:URLString parameters:parameters result:requestBlock];
        } else {
            task = [self getWithUrlString:URLString parameters:parameters result:requestBlock];
        }
        if (task != nil) {
            [self.arr_sessionTask addObject:task];
        }
    }
    else
    {
        [TTProgressHUD showErrorTips:@"当前无网络连接，请检查网络连接!"];
    }
}

- (NSURLSessionDataTask *)postWithUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock {
    [self setSignture2HeaderForParameter:parameters orUrlString:URLString];
    NSURLSessionDataTask *task = [_apiClient POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.arr_sessionTask removeObject:task];
        NSString *cacheKey = [self cacheKeyWithUrlString:URLString parameters:parameters];
        [self successResponseObject:responseObject result:requestBlock cacheKey:cacheKey];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.arr_sessionTask removeObject:task];
        [self failResponseError:error result:requestBlock];
    }];
    return task;
}

- (NSURLSessionDataTask *)getWithUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock {
    [self setSignture2HeaderForParameter:parameters orUrlString:URLString];
    NSURLSessionDataTask *task = [_apiClient GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.arr_sessionTask removeObject:task];
        NSString *cacheKey = [self cacheKeyWithUrlString:URLString parameters:parameters];
        [self successResponseObject:responseObject result:requestBlock cacheKey:cacheKey];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.arr_sessionTask removeObject:task];
        [self failResponseError:error result:requestBlock];
    }];
    return task;
}

- (void)setSignture2HeaderForParameter:(id)parameters orUrlString:(NSString *)urlString {
    NSString *signture = [self getSignatureByParameter:(NSDictionary *)parameters orUrlString:urlString];
    [_apiClient.requestSerializer setValue:signture forHTTPHeaderField:kSigntureKey];
}

- (void)successResponseObject:(id  _Nullable)responseObject result:(ResultBlock)requestBlock cacheKey:(NSString *)key {
    [_cache setObject:responseObject forKey:key];
    if (requestBlock) {
        requestBlock([responseObject[APIReturnCode] integerValue], responseObject[APIReturnData], nil);
    }
}

- (void)failResponseError:(NSError *)error result:(ResultBlock)requestBlock {
    if (requestBlock) {
        requestBlock(error.code, nil, error);
    }
}

- (NSString *)cacheKeyWithUrlString:(NSString *)URLString parameters:(NSDictionary *)parameters {
    NSString *keyString = [URLString stringByAppendingString:[parameters tt_urlParamString]];
    return [keyString tt_base64EncodedString];
}


/**
 取得签名字符串
 
 *****生成签名方式—- 有请求参数*****
 根据接口请求参数key值进行ascii排序
 拼接参数的value值为一个新的字符串
 如果用户登录，再拼接用户登录名+用户密码
 对签名字符串进行md5加密
 对加密过后的字符在第m位插入n位随机字符串进行加盐。
 进行url编码，添加参数到header，参数名为TQSignature
 
 *****生成签名方式—- 无请求参数*****
 取接口地址作为基础字符串
 如果用户登录，再拼接用户登录名+用户密码
 对签名字符串进行md5加密
 对加密过后的字符在第m位插入n位随机字符串进行加盐。
 进行url编码，添加参数到header，参数名为TQSignature

 @param parameter 参数
 @return 签名
 */
- (NSString *)getSignatureByParameter:(NSDictionary *)parameter orUrlString:(NSString *)urlString {
    NSMutableString *signature = [[NSMutableString alloc] init];
    if (parameter != nil) {
        NSArray *keyArray = [self sortByKeyASCIIOfParameter:parameter];
        for (NSString *key in keyArray) {
            id obj = parameter[key];
            [signature appendFormat:@"%@", obj];
        }
    } else {
        [signature appendString:urlString];
    }

#warning 如果登录 ，加上用户名和密码

    
    
    NSMutableString *md5Signature = [[NSMutableString alloc] initWithString:[signature tt_md5String]];
    [md5Signature insertString:[self randomStringWithLength:kSignSaltLength] atIndex:kSignSaltStarIndex];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [md5Signature stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#pragma clang diagnostic pop
}

- (NSArray *)sortByKeyASCIIOfParameter:(NSDictionary *)parameter {
    NSArray *keyArray = [parameter allKeys];
    NSArray *sortKeyArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        NSRange range = NSMakeRange(0, obj1.length);
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch | NSNumericSearch | NSWidthInsensitiveSearch | NSForcedOrderingSearch range:range];
    }];
    return sortKeyArray;
}


/**
 生成随机字符串

 @param len 长度
 @return 字符串
 */
-(NSString *)randomStringWithLength:(NSInteger)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((uint32_t)[letters length])]];
    }
    return randomString;
}

//- (NSString *)randomForString {
//    int num = (arc4random() % (int)pow(10.f, (kSignSaltLength)*1.0f));
//    return [NSString stringWithFormat:@"%d", num];
//}

#pragma mark - getters、setters
- (NSMutableArray *)arr_sessionTask {
    if (_arr_sessionTask == nil) {
        _arr_sessionTask = [NSMutableArray arrayWithCapacity:0];
    }
    return _arr_sessionTask;
}

@end
