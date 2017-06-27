//
//  AFURLSessionManager+TTDownload.h
//  AppPlatformDemo
//
//  Created by 天智慧启 on 2017/6/26.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import <AFNetworking/AFURLSessionManager.h>

NS_ASSUME_NONNULL_BEGIN


@interface AFURLSessionManager (TTDownload)

- (NSURLSessionDownloadTask *)tt_downloadTaskWithRequest:(NSURLRequest *)request
                                             progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                                          destination:(nullable NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                                    completionHandler:(nullable void (^)(NSURLResponse *response, NSURL * _Nullable filePath, NSURLSessionDownloadTask *downloadTask, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
