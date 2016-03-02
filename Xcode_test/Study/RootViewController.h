//
//  RootViewController.h
//  Xcode_test
//
//  Created by SunJishuai on 16/3/2.
//  Copyright (c) 2016年 SunJishuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNavigationBar.h"
@interface RootViewController : UIViewController<SJSNavigationDelegate>
@property (nonatomic,strong) NSString * parentName;
@property (nonatomic,strong) SNavigationBar * SNavi;//导航栏
@property (nonatomic,strong) NSString * viewTitle;
@end
