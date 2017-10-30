//
//  FunctionClass.m
//  AFNDemo
//
//  Created by 胡焕 on 2017/10/30.
//  Copyright © 2017年 胡焕. All rights reserved.
//

#import "FunctionClass.h"
#import "UIImage+GIF.h"
@implementation FunctionClass
// 网络状态
+ (void)networkState:(void(^)(NSInteger state))state {
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMon itoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (state) {
            state(status);
        }
    }];
}
// 系统加载菊花
+ (UIActivityIndicatorView *)showActivityIndicatorViewAddedTo:(UIView *)view {
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    //    activityIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [view addSubview:activityIndicatorView];
    return activityIndicatorView;
}
// 加载等待HUD
+ (MBProgressHUD *)showHudWithTitle:(NSString *)title addToSubview:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.font = [UIFont systemFontOfSize:14];
    hud.label.text = title;
    return hud;
}
// 提示文字HUD
+ (MBProgressHUD *)showTextHudAddToSubview:(UIView *)view promptInfo:(NSString *)prompt {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = prompt;
    hud.margin = 10.f;
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1.8];
    return hud;
}
+ (MBProgressHUD *)showHudWithGif:(NSString *)imageName addToSubview:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImageView *gifImageView = [[UIImageView alloc] initWithImage:[UIImage sd_animatedGIFNamed:imageName]];
    hud.customView = gifImageView;
    //设置方框view为该模式后修改颜色才有效果
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置方框view背景色
    hud.bezelView.backgroundColor = [UIColor clearColor];
    //设置总背景view的背景色，并带有透明效果
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    //    hud.color = [UIColor clearColor];//功能类似hud.bezelView.backgroundColor
    return hud;
}

+ (NSString *)convertToJsonData:(NSDictionary *)dic {
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    
    // 去除字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    /* 处理去除空格后的时间格式问题 */
    for (NSString *key in dic.allKeys) {
        if ([key isEqualToString:@"userinfo"] || [key isEqualToString:@"datainfo"]) {
            NSDictionary *userDic;
            if ([key isEqualToString:@"userinfo"]) {
                userDic = dic[@"userinfo"];
            }else {
                userDic = dic[@"datainfo"];
            }
            for (NSString *userKey in userDic.allKeys) {
                if ([userKey isEqualToString:@"logintime"] || [userKey isEqualToString:@"userinfo"]) {
                    NSString *loginTime;
                    if ([userKey isEqualToString:@"logintime"]) {
                        loginTime = [userDic[@"logintime"] substringToIndex:10];
                    }else {
                        loginTime = [userDic[@"userinfo"][@"logintime"] substringToIndex:10];
                    }
                    NSRange range1 = [mutStr rangeOfString:loginTime];
                    [mutStr insertString:@" " atIndex:range1.location + range1.length];
                }
            }
        }
    }
    
    NSRange range2 = {0,mutStr.length};
    
    // 去除字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
    
}
@end
