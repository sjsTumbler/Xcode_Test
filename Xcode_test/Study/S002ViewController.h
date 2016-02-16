//
//  S002ViewController.h
//  Xcode_test
//
//  Created by SunJishuai on 16/2/16.
//  Copyright (c) 2016年 SunJishuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNavigationBar.h"
@interface S002ViewController : UIViewController<SJSNavigationDelegate>
@property (nonatomic,strong) NSString * parentName;
@end
