//
//  AFNManager.h
//  AFNDemo
//
//  Created by 胡焕 on 2017/10/30.
//  Copyright © 2017年 胡焕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UploadParam.h"
// aaaaa@test.com

//action
////action



https://huan.aaaaa.wgine-inc.top",

https://huan.aaaaa.tuya-in.net.top",



aaaaa@tuya.com






////act

//aaaaa@tuya.com



@interface AFNManager : NSObject
@property (nonatomic,strong) NSURLSessionDataTask *dataTask;
+ (instancetype)shareAFNManager;

// POST
- (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure isShowErrorPrompt:(BOOL)isShowErrorPrompt showHUDAddedToView:(UIView *)view promptText:(NSString *)promptText;
// GET
- (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id responseObject))success
                 failure:(void (^)(NSError *error))failure isShowErrorPrompt:(BOOL)isShowErrorPrompt showHUDAddedToView:(UIView *)view promptText:(NSString *)promptText;

/**
 *  上传图片
 *
 *  @param URLString   上传图片的网址字符串
 *  @param parameters  上传图片的参数
 *  @param uploadParam 上传图片的信息
 *  @param success     上传成功的回调
 *  @param failure     上传失败的回调
 */
- (void)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                uploadParam:(UploadParam *)uploadParam
                   progress:(void (^)(NSProgress *progress))uploProgress
                    success:(void (^)(id responseObject))success
                    failure:(void (^)(NSError *error))failure
          isShowErrorPrompt:(BOOL)isShowErrorPrompt
         showHUDAddedToView:(UIView *)view
                 promptText:(NSString *)promptText;



// PUT
- (void)putWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(id responseObject))success;

@end

