//
//  AFURLSessionManager+TTDownload.m
//  AppPlatformDemo
//
//  Created by 天智慧启 on 2017/6/26.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import "AFURLSessionManager+TTDownload.h"

@implementation AFURLSessionManager (TTDownload)

- (NSURLSessionDownloadTask *)tt_downloadTaskWithRequest:(NSURLRequest *)request
                                                progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                                             destination:(nullable NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
                                       completionHandler:(nullable void (^)(NSURLResponse *response, NSURL * _Nullable filePath, NSURLSessionDownloadTask *downloadTask, NSError * _Nullable error))completionHandler {
    __block NSURLSessionDownloadTask *downloadTask = nil;
    downloadTask = [self downloadTaskWithRequest:request progress:downloadProgressBlock destination:destination completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        completionHandler(response, filePath, downloadTask, error);
    }];
    return downloadTask;
}
@end


