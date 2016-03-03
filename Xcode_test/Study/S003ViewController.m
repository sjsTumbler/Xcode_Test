//
//  S003ViewController.m
//  Xcode_test
//
//  Created by SunJishuai on 16/3/2.
//  Copyright (c) 2016年 SunJishuai. All rights reserved.
//

#import "S003ViewController.h"

@interface S003ViewController ()

@end

@implementation S003ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self init123];
}

- (void)init123 {
    NSLog(@"%@",NSHomeDirectory());
    NSString *schoolsPath = [[NSBundle mainBundle] pathForResource:@"365" ofType:@"txt"];
    NSString *schoolsContent = [[NSString alloc] initWithContentsOfFile:schoolsPath encoding:NSUTF8StringEncoding error:nil];
    NSArray *schoolsArray = [schoolsContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    NSString *plistPath = [NSHomeDirectory() stringByAppendingPathComponent:@"bible.plist"];
    NSMutableArray *resultsArr = [[NSMutableArray alloc] initWithCapacity:0];
    //j+2 的原因:转出来的TXT解出来每行后面都有空格
    for (NSInteger j = 0 , k = 1; j < schoolsArray.count; j= j+2, k++){
        NSString *schoolStr = [schoolsArray objectAtIndex:j];
        NSArray *schoolArr = [schoolStr componentsSeparatedByString:@"\t"];
        NSMutableArray * bibleA = [[NSMutableArray alloc]init];
        for (int i = 0; i<schoolArr.count; i++) {
            NSMutableDictionary * hhdic = [[NSMutableDictionary alloc]init];
            [hhdic setValue:@(k*1000+i+1) forKey:@"onlyTag"];
            switch (i) {
                case 0:
                {
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"startNumber0"];
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"endNumber0"];
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"startNumber1"];
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"endNumber1"];
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"startNumber2"];
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"endNumber2"];
                }
                    break;
                case 1:
                {
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"startNumber0"];
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"endNumber0"];
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"startNumber1"];
                    [hhdic setValue:@(k*1000000+i*1000+j) forKey:@"endNumber1"];
                }
                    break;
                case 2:
                {
                    [hhdic setValue:@(119000000+i*1000+j) forKey:@"startNumber0"];
                    [hhdic setValue:@(119000000+i*1000+j) forKey:@"endNumber0"];
                    [hhdic setValue:@(119000000+i*1000+j) forKey:@"startNumber1"];
                    [hhdic setValue:@(119000000+i*1000+j) forKey:@"endNumber1"];
                }
                    break;
                case 3:
                {
                    [hhdic setValue:@(120000000+i*1000+j) forKey:@"startNumber0"];
                    [hhdic setValue:@(120000000+i*1000+j) forKey:@"endNumber0"];
                }
                    break;
                default:
                    break;
            }
            [hhdic setValue:[schoolArr objectAtIndex:i] forKey:@"title"];
            
            [bibleA addObject:hhdic];
        }
        [resultsArr addObject:bibleA];
    }
    [resultsArr writeToFile:plistPath atomically:YES];
    
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
