//
//  S001ViewController.h
//  Xcode_test
//
//  Created by SunJishuai on 16/1/23.
//  Copyright (c) 2016年 SunJishuai. All rights reserved.
//
/*
 1、输出
 */
#import <UIKit/UIKit.h>
#import "SNavigationBar.h"
@interface S001ViewController : UIViewController <SJSNavigationDelegate>
@property (nonatomic,strong) NSString * parentName;
@end
