//
//  ViewController.m
//  AFNTool
//
//  Created by 胡焕 on 2017/10/30.
//  Copyright © 2017年 胡焕. All rights reserved.
//

#import "ViewController.h"
#import "AFNManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AFNManager shareAFNManager] postWithURLString:@"" parameters:nil success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    } isShowErrorPrompt:YES showHUDAddedToView:nil promptText:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
