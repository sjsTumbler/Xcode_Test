//
//  ViewController.m
//  Xcode_test
//
//  Created by SunJishuai on 16/1/23.
//  Copyright (c) 2016年 SunJishuai. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    SNavigationBar * _SNavi;//导航栏
    UITableView    * _functionsTable;//展示列表
    NSMutableArray * _functionsArray;//功能数组
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    //set navigationBar
    [self setNavigationBar];
    //set table
    [self setTable];
}
- (void)initData{
    _functionsArray = [[NSMutableArray alloc]initWithObjects:@"001_输出",@"002_60S倒计时", nil];
}
//set navigationBar
- (void)setNavigationBar {
    [self.navigationController setNavigationBarHidden:YES];
    _SNavi = [[SNavigationBar alloc]initWithTitle:@"Xcode_Test"];
    [self.view addSubview:_SNavi];
}
//set table
- (void)setTable {
    _functionsTable = [[UITableView alloc]initWithFrame:CGRectMake(0, navigationBarHight, viewWidth, viewHeight-navigationBarHight) style:UITableViewStylePlain];
    _functionsTable.delegate = self;
    _functionsTable.dataSource = self;
    _functionsTable.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_functionsTable];
    
}

//table delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _functionsArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellName = @"cellName";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.textLabel.text = [_functionsArray objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{

            S001ViewController * svc = [[S001ViewController alloc]init];
            svc.parentName = @"Xcode_Test";
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        case 1:{
            S002ViewController *svc = [[S002ViewController alloc]init];
            svc.parentName = @"Xcode_Test";
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        default:
            break;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
