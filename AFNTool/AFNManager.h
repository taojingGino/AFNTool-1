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

#huan.hu@tuya.cn
#huan.hu@tuya-qq.cn.com
#huan.hu@tuya.net
#huan.hu123@tuya.com
#huan.hu@tuya.-.com


https://huan.aaaaa.wgine-inc.top",

https://huan.aaaaa.tuya-in.net.top",




"Key_App": 'ugjv47qpjd5nnegmqs4hcc'
    "Key": 'ugjv47qpjd5nnegmqs4hcc1'
    pid : '6c3a42121c0e631ff7hum3'
    uuid = '6c3a42121c0e631ff7hum4'
    gwid = '6c3a42121c0e631ff7hum45'
    seckey = '6c3a42121c0e631ff7hum456'
    localkey = '6c3a42121c0e631ff7hum4567'
    
    app_Key: 'ugjv47qpjd5nnegmqs4hqc'
    app Key: 'ugjv47qpjd5nnegmqs4hxc'
   android:value = "wqcv47qpjd5qqegm123"
   android:value="yrq8t3tgyw9dhry7xnuckgdvwe123456"


"pwd" = '1Aa123456cc_'
password = 'Aa123456caaac_'

http://wiki-a.tuyaus-huanhuan.com
http://wiki-a.0-huanhu.tuya-inc.com
http://wiki-a.1-huanhu.tuya-inc.top
http://wiki-a.2-huanhu.wgine-daily.com
http://wiki-a.3-huanhu.wgine-inc.com
http://wiki-a.4-huanhu.wgine-inc.top
http://wiki-a.5-huanhu.wgine-prep.top
http://wiki-a.6-huanhu.wgine.com
http://wiki-a.7-huanhu.tuya-in.net
http://wiki-a.8-huanhu.wgine-dev.com




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

