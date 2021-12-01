//
//  AFNManager.m
//  AFNDemo
//
//  Created by 胡焕 on 2017/10/30.
//  Copyright © 2017年 胡焕. All rights reserved.
//

#import "AFNManager.h"
#import "AFNetworking.h"
#import "FunctionClass.h"





@implementation AFNManager
+ (instancetype)shareAFNManager {
    static AFNManager *_shareAFNManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareAFNManager = [[AFNManager alloc] init];
    });
    return _shareAFNManager;
}
#pragma mark -- POST请求 --
- (void)postWithURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure isShowErrorPrompt:(BOOL)isShowErrorPrompt showHUDAddedToView:(UIView *)view promptText:(NSString *)promptText {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 26;
    _dataTask = [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success && [responseObject[@"code"] intValue] == 1 && [responseObject[@"msg"] isEqualToString:@"成功"]) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"********************************请求失败**********************************");
        if (failure) {
            failure(error);
            if (isShowErrorPrompt) {
                [FunctionClass networkState:^(NSInteger state) {
                    NSString *promptStr;
                    if (state == 0 || state == -1) {
                        promptStr = @"网络连接已断开，请检查网络。";
                    }else {
                        promptStr = promptText;
                    }
                    [FunctionClass showTextHudAddToSubview:view promptInfo:promptStr];
                }];
            }
        }
    }];
}
#pragma mark -- GET请求 --
- (void)getWithURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure isShowErrorPrompt:(BOOL)isShowErrorPrompt showHUDAddedToView:(UIView *)view promptText:(NSString *)promptText {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 声明请求的数据是json类型
    manager.requestSerializer.timeoutInterval = 26;
    _dataTask = [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            if (isShowErrorPrompt) {
                [FunctionClass networkState:^(NSInteger state) {
                    NSString *promptStr;
                    if (state == 0) {
                        promptStr = @"网络连接已断开，请检查网络。";
                    }else {
                        promptStr = promptText;
                    }
                    [FunctionClass showTextHudAddToSubview:view promptInfo:promptStr];
                }];
            }
        }
    }];
}
#pragma mark -- 上传图片 --
- (void)uploadWithURLString:(NSString *)URLString parameters:(id)parameters uploadParam:(UploadParam *)uploadParam progress:(void (^)(NSProgress *))uploProgress success:(void (^)(id))success failure:(void (^)(NSError *))failure  isShowErrorPrompt:(BOOL)isShowErrorPrompt showHUDAddedToView:(UIView *)view promptText:(NSString *)promptText {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    __block MBProgressHUD *progressHud;
    _dataTask = [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (uploProgress) {
            uploProgress(uploadProgress);
            
            //            progressHud = [MBProgressHUD showHUDAddedTo:view animated:YES];
            //            progressHud.mode = MBProgressHUDModeDeterminate;
            //            progressHud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
            //
            //            // Configure the button.
            //            [progressHud.button setTitle:NSLocalizedString(@"Cancel", @"HUD cancel button title") forState:UIControlStateNormal];
            //            [progressHud.button addTarget:self action:@selector(cancelWork:) forControlEvents:UIControlEventTouchUpInside];
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
            [FunctionClass showTextHudAddToSubview:view promptInfo:@"图片上传成功"];
            //            [progressHud hideAnimated:YES];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            //            [progressHud hideAnimated:YES];
            if (isShowErrorPrompt) {
                [FunctionClass networkState:^(NSInteger state) {
                    NSString *promptStr;
                    if (state == 0) {
                        promptStr = @"网络连接已断开，请检查网络。";
                    }else {
                        promptStr = promptText;
                    }
                    [FunctionClass showTextHudAddToSubview:view promptInfo:promptStr];
                }];
            }
        }
    }];
}
- (void)cancelWork:(BOOL)is {
    
}
// PUT
- (void)putWithURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success{
    
    NSURL *url = [NSURL URLWithString:URLString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"PUT";
    
    // request.allHTTPHeaderFields = @{@"":@""}; //此处为请求头，类型为字典
    
    NSString *msg = [FunctionClass convertToJsonData:parameters];
    
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    
    request.HTTPBody = data;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{ // 主线程返回 刷新UI
            if (success) {
                success(dic);
            }
        });
        
    }] resume];
    
}
@end
