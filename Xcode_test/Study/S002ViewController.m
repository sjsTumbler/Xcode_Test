//
//  S002ViewController.m
//  Xcode_test
//
//  Created by SunJishuai on 16/2/16.
//  Copyright (c) 2016年 SunJishuai. All rights reserved.
//

#import "S002ViewController.h"
#include <dispatch/dispatch.h>
@interface S002ViewController ()

@end

@implementation S002ViewController
{
    UIButton * _getIdentifyBtn;
    SNavigationBar * _SNavi;//导航栏
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavigationBar];
    
    _getIdentifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _getIdentifyBtn.frame = CGRectMake(100, 100, 150, 50);
    [_getIdentifyBtn addTarget:self action:@selector(startTime) forControlEvents:UIControlEventTouchUpInside];
    _getIdentifyBtn.backgroundColor = [UIColor lightGrayColor];
    [_getIdentifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:_getIdentifyBtn];
}
//set navigationBar
- (void)setNavigationBar {
    _SNavi = [[SNavigationBar alloc]initWithTitle:@"002_60S倒计时"];
    //    [_SNavi setLeftBtn_bacK];
    [_SNavi setLeftBtn_parentName:self.parentName];
    _SNavi.delegate = self;
    [self.view addSubview:_SNavi];
}
//由于button是系统样式,把button换成自定义样式就可以解决问题
-(void)startTime{
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行一次
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){// 倒计时结束，关闭
            dispatch_source_cancel(_timer);
           dispatch_async(dispatch_get_main_queue(), ^{
            [_getIdentifyBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
            _getIdentifyBtn.userInteractionEnabled = YES;
        });
           }else{
               dispatch_async(dispatch_get_main_queue(), ^{
                   
                   [UIView beginAnimations:nil context:nil];
                   [UIView setAnimationDuration:1];
                   [_getIdentifyBtn setTitle:[NSString stringWithFormat:@"%zd秒后重新发送",timeout] forState:UIControlStateNormal];
                   [UIView commitAnimations];
                   _getIdentifyBtn.userInteractionEnabled = NO;
               });
               timeout--;
           }
           });
        dispatch_resume(_timer);
        
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
