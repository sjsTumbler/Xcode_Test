//
//  S001ViewController.m
//  Xcode_test
//
//  Created by SunJishuai on 16/1/23.
//  Copyright (c) 2016年 SunJishuai. All rights reserved.
//

#import "S001ViewController.h"

@interface S001ViewController ()

@end

@implementation S001ViewController
{
        SNavigationBar * _SNavi;//导航栏
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //set navigationBar
    [self setNavigationBar];
    
    //001 输出
    [self output];
}
//set navigationBar
- (void)setNavigationBar {
    _SNavi = [[SNavigationBar alloc]initWithTitle:@"001输出"];
//    [_SNavi setLeftBtn_bacK];
    [_SNavi setLeftBtn_parentName:self.parentName];
    _SNavi.delegate = self;
    [self.view addSubview:_SNavi];
}
- (void)SJSNavigationLeftAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark     输出
/**
 @author Jesus   , 16-01-23 14:01:09
 
 @brief 输出
 */
- (void)output {
    //1、NSLog是标准的日志输出方式，可以输出传递进去的格式化字符
    NSLog(@"hello world, I am NSLog!");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
