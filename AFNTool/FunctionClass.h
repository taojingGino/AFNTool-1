//
//  FunctionClass.h
//  AFNDemo
//
//  Created by 胡焕 on 2017/10/30.
//  Copyright © 2017年 胡焕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MBProgressHUD.h"
@interface FunctionClass : NSObject
// 网络状态
+ (void)networkState:(void(^)(NSInteger state))state;

// 系统加载菊花
+ (UIActivityIndicatorView *)showActivityIndicatorViewAddedTo:(UIView *)view;
// 加载等待HUD
+ (MBProgressHUD *)showHudWithTitle:(NSString *)title addToSubview:(UIView *)view;
// 提示文字HUD
+ (MBProgressHUD *)showTextHudAddToSubview:(UIView *)view promptInfo:(NSString *)prompt;

// 提示自定义Gif HUD
+ (MBProgressHUD *)showHudWithGif:(NSString *)imageName addToSubview:(UIView *)view;

+ (NSString *)convertToJsonData:(NSDictionary *)dic;
@end
