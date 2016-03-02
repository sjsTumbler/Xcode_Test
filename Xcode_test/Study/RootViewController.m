//
//  RootViewController.m
//  Xcode_test
//
//  Created by SunJishuai on 16/3/2.
//  Copyright (c) 2016年 SunJishuai. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _SNavi = [[SNavigationBar alloc]initWithTitle:self.viewTitle];
    [_SNavi setLeftBtn_parentName:self.parentName];
    _SNavi.delegate = self;
    [self.view addSubview:_SNavi];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)SJSNavigationLeftAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
