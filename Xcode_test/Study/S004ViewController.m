//
//  S004ViewController.m
//  Xcode_test
//
//  Created by SunJishuai on 16/4/25.
//  Copyright © 2016年 SunJishuai. All rights reserved.
//

#import "S004ViewController.h"
#import "LunarSolarConverter.h"

@interface S004ViewController ()

@end

@implementation S004ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * now = [[PublicFunctions sharedPublicFunctions]getDateString_Now];
    NSArray * nowArray = [now componentsSeparatedByString:@"-"];
    Solar * sloar = [[Solar alloc]init];
    Lunar * lunar = [[Lunar alloc]init];
    sloar.solarYear = [[nowArray firstObject]intValue];
    sloar.solarMonth = [[nowArray objectAtIndex:1]intValue];
    sloar.solarDay = [[nowArray lastObject]intValue];
    lunar = [LunarSolarConverter solarToLunar:sloar];
    NSString * now_lunar = [self formatlunarWithYear:lunar.lunarYear AndMonth:lunar.lunarMonth AndDay:lunar.lunarDay];

    UILabel * now_day = [[UILabel alloc]initWithFrame:CGRectMake(20,100,300,300)];
    now_day.text = [NSString stringWithFormat:@"今天是%d年%d月%d日,农历%@,星座:%@     %@",sloar.solarYear,sloar.solarMonth,sloar.solarDay,now_lunar,[self getXingzuo:[NSDate date]],[self LunarForSolar:[NSDate date]]];
    now_day.numberOfLines = 0;
    [self.view addSubview:now_day];
}

//转换后的农历还可以再格式化一下

- (NSString *)formatlunarWithYear:(int)year AndMonth:(int)month AndDay:(int)day
{
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月", nil];
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    return [NSString stringWithFormat:@"%d年%@%@", year, chineseMonths[month - 1], chineseDays[day - 1]];
}


//然后就是星座计算，没什么难度，就是算的太麻烦，所以直接拿来用就行了。

-(NSString *)getXingzuo:(NSDate *)in_date
{
    //计算星座
    NSString *retStr=@"";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM"];
    int i_month=0;
    NSString *theMonth = [dateFormat stringFromDate:in_date];
    if([[theMonth substringToIndex:0] isEqualToString:@"0"]){
        i_month = [[theMonth substringFromIndex:1] intValue];
    }else{
        i_month = [theMonth intValue];
    }
    
    [dateFormat setDateFormat:@"dd"];
    int i_day=0;
    NSString *theDay = [dateFormat stringFromDate:in_date];
    if([[theDay substringToIndex:0] isEqualToString:@"0"]){
        i_day = [[theDay substringFromIndex:1] intValue];
    }else{
        i_day = [theDay intValue];
    }
    /*
     摩羯座 12月22日------1月19日
     水瓶座 1月20日-------2月18日
     双鱼座 2月19日-------3月20日
     白羊座 3月21日-------4月19日
     金牛座 4月20日-------5月20日
     双子座 5月21日-------6月21日
     巨蟹座 6月22日-------7月22日
     狮子座 7月23日-------8月22日
     处女座 8月23日-------9月22日
     天秤座 9月23日------10月23日
     天蝎座 10月24日-----11月21日
     射手座 11月22日-----12月21日
     */
    switch (i_month) {
        case 1:
            if(i_day>=20 && i_day<=31){
                retStr=@"水瓶座";
            }
            if(i_day>=1 && i_day<=19){
                retStr=@"摩羯座";
            }
            break;
        case 2:
            if(i_day>=1 && i_day<=18){
                retStr=@"水瓶座";
            }
            if(i_day>=19 && i_day<=31){
                retStr=@"双鱼座";
            }
            break;
        case 3:
            if(i_day>=1 && i_day<=20){
                retStr=@"双鱼座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"白羊座";
            }
            break;
        case 4:
            if(i_day>=1 && i_day<=19){
                retStr=@"白羊座";
            }
            if(i_day>=20 && i_day<=31){
                retStr=@"金牛座";
            }
            break;
        case 5:
            if(i_day>=1 && i_day<=20){
                retStr=@"金牛座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"双子座";
            }
            break;
        case 6:
            if(i_day>=1 && i_day<=21){
                retStr=@"双子座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"巨蟹座";
            }
            break;
        case 7:
            if(i_day>=1 && i_day<=22){
                retStr=@"巨蟹座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"狮子座";
            }
            break;
        case 8:
            if(i_day>=1 && i_day<=22){
                retStr=@"狮子座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"处女座";
            }
            break;
        case 9:
            if(i_day>=1 && i_day<=22){
                retStr=@"处女座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"天秤座";
            }
            break;
        case 10:
            if(i_day>=1 && i_day<=23){
                retStr=@"天秤座";
            }
            if(i_day>=24 && i_day<=31){
                retStr=@"天蝎座";
            }
            break;
        case 11:
            if(i_day>=1 && i_day<=21){
                retStr=@"天蝎座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"射手座";
            }
            break;
        case 12:
            if(i_day>=1 && i_day<=21){
                retStr=@"射手座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"摩羯座";
            }
            break;
    }
    return retStr;
}
//C: 代码:
//
///*------------农历转换函数-----------*/
//char *GetDayOf(PSYSTEMTIME pSt)
//{
//    /*天干名称*/
//    const char *cTianGan[] = {"甲","乙","丙","丁","戊","己","庚","辛","壬","癸"};
//    
//    /*地支名称*/
//    const char *cDiZhi[] = {"子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"};
//    
//    /*属相名称*/
//    const char *cShuXiang[] = {"鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪"};
//    
//    /*农历日期名*/
//    const char *cDayName[] = {"*","初一","初二","初三","初四","初五","初六","初七","初八","初九","初十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十",
//        "廿一","廿二","廿三","廿四","廿五","廿六","廿七","廿八","廿九","三十"};
//    
//    /*农历月份名*/
//    const char *cMonName[] = {"*","正","二","三","四","五","六","七","八","九","十","十一","腊"};
//    
//    /*公历每月前面的天数*/
//    const int wMonthAdd[12] = {0,31,59,90,120,151,181,212,243,273,304,334};
//    
//    /*农历数据*/
//    const int wNongliData[100] = {2635,333387,1701,1748,267701,694,2391,133423,1175,396438,
//        3402,3749,331177,1453,694,201326,2350,465197,3221,3402,
//        400202,2901,1386,267611,605,2349,137515,2709,464533,1738,
//        2901,330421,1242,2651,199255,1323,529706,3733,1706,398762,
//        2741,1206,267438,2647,1318,204070,3477,461653,1386,2413,
//        330077,1197,2637,268877,3365,531109,2900,2922,398042,2395,
//        1179,267415,2635,661067,1701,1748,398772,2742,2391,330031,
//        1175,1611,200010,3749,527717,1452,2742,332397,2350,3222,
//        268949,3402,3493,133973,1386,464219,605,2349,334123,2709,
//        2890,267946,2773,592565,1210,2651,395863,1323,2707,265877};
//    
//    static int wCurYear,wCurMonth,wCurDay;
//    static int nTheDate,nIsEnd,m,k,n,i,nBit;
//    TCHAR szNongli[30], szNongliDay[10],szShuXiang[10];
//    /*---取当前公历年、月、日---*/
//    wCurYear = pSt->wYear;
//    wCurMonth = pSt->wMonth;
//    wCurDay = pSt->wDay;
//    
//    /*---计算到初始时间1921年2月8日的天数：1921-2-8(正月初一)---*/
//    nTheDate = (wCurYear - 1921) * 365 + (wCurYear - 1921) / 4 + wCurDay + wMonthAdd[wCurMonth - 1] - 38;
//    if((!(wCurYear % 4)) && (wCurMonth > 2))
//        nTheDate = nTheDate + 1;
//    
//    /*--计算农历天干、地支、月、日---*/
//    nIsEnd = 0;
//    m = 0;
//    while(nIsEnd != 1)
//    {
//        if(wNongliData[m] < 4095)
//            k = 11;
//        else
//            k = 12;
//        n = k;
//        while(n>=0)
//        {
//            //获取wNongliData(m)的第n个二进制位的值
//            nBit = wNongliData[m];
//            for(i=1;i<n+1;i++)
//                nBit = nBit/2;
//            nBit = nBit % 2;
//            if (nTheDate <= (29 + nBit))
//            {
//                nIsEnd = 1;
//                break;
//            }
//            nTheDate = nTheDate - 29 - nBit;
//            n = n - 1;
//        }
//        if(nIsEnd){
//            break;
//        }
//        m = m + 1;
//    }
//    wCurYear = 1921 + m;
//    wCurMonth = k - n + 1;
//    wCurDay = nTheDate;
//    if (k == 12)
//    {
//        if (wCurMonth == wNongliData[m] / 65536 + 1){
//            wCurMonth = 1 - wCurMonth;
//        }
//        else if (wCurMonth > wNongliData[m] / 65536 + 1){
//            wCurMonth = wCurMonth - 1;
//        }
//    }
//    
//    /*--生成农历天干、地支、属相 ==> wNongli--*/
//    wsprintf(szShuXiang,"%s",cShuXiang[((wCurYear - 4) % 60) % 12]);
//    wsprintf(szNongli,"%s(%s%s)年",szShuXiang,cTianGan[((wCurYear - 4) % 60) % 10],cDiZhi[((wCurYear - 4) % 60) % 12]);
//    
//    /*--生成农历月、日 ==> wNongliDay--*/
//    if (wCurMonth < 1){
//        wsprintf(szNongliDay,"闰%s",cMonName[-1 * wCurMonth]);
//    }
//    else{
//        strcpy(szNongliDay,cMonName[wCurMonth]);
//    }
//    
//    strcat(szNongliDay,"月");
//    strcat(szNongliDay,cDayName[wCurDay]);
//    return strcat(szNongli,szNongliDay);
//}



//Objective-C 代码:

//农历转换函数
-(NSString *)LunarForSolar:(NSDate *)solarDate{
    //天干名称
    NSArray *cTianGan = [NSArray arrayWithObjects:@"甲",@"乙",@"丙",@"丁",@"戊",@"己",@"庚",@"辛",@"壬",@"癸", nil];
    
    //地支名称
    NSArray *cDiZhi = [NSArray arrayWithObjects:@"子",@"丑",@"寅",@"卯",@"辰",@"巳",@"午",@"未",@"申",@"酉",@"戌",@"亥",nil];
    
    //属相名称
    NSArray *cShuXiang = [NSArray arrayWithObjects:@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪",nil];
    
    //农历日期名
    NSArray *cDayName = [NSArray arrayWithObjects:@"*",@"初一",@"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",
                         @"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",
                         @"廿一",@"廿二",@"廿三",@"廿四",@"廿五",@"廿六",@"廿七",@"廿八",@"廿九",@"三十",nil];
    
    //农历月份名
    NSArray *cMonName = [NSArray arrayWithObjects:@"*",@"正",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"腊",nil];
    
    //公历每月前面的天数
    const int wMonthAdd[12] = {0,31,59,90,120,151,181,212,243,273,304,334};
    
    //农历数据
    const int wNongliData[100] = {2635,333387,1701,1748,267701,694,2391,133423,1175,396438
        ,3402,3749,331177,1453,694,201326,2350,465197,3221,3402
        ,400202,2901,1386,267611,605,2349,137515,2709,464533,1738
        ,2901,330421,1242,2651,199255,1323,529706,3733,1706,398762
        ,2741,1206,267438,2647,1318,204070,3477,461653,1386,2413
        ,330077,1197,2637,268877,3365,531109,2900,2922,398042,2395
        ,1179,267415,2635,661067,1701,1748,398772,2742,2391,330031
        ,1175,1611,200010,3749,527717,1452,2742,332397,2350,3222
        ,268949,3402,3493,133973,1386,464219,605,2349,334123,2709
        ,2890,267946,2773,592565,1210,2651,395863,1323,2707,265877};
    
    static int wCurYear,wCurMonth,wCurDay;
    static int nTheDate,nIsEnd,m,k,n,i,nBit;
    
    //取当前公历年、月、日
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:solarDate];
    wCurYear = (int)[components year];
    wCurMonth = (int)[components month];
    wCurDay = (int)[components day];
    
    //计算到初始时间1921年2月8日的天数：1921-2-8(正月初一)
    nTheDate = (wCurYear - 1921) * 365 + (wCurYear - 1921) / 4 + wCurDay + wMonthAdd[wCurMonth - 1] - 38;
    if((!(wCurYear % 4)) && (wCurMonth > 2))
        nTheDate = nTheDate + 1;
    
    //计算农历天干、地支、月、日
    nIsEnd = 0;
    m = 0;
    while(nIsEnd != 1)
    {
        if(wNongliData[m] < 4095)
            k = 11;
        else
            k = 12;
        n = k;
        while(n>=0)
        {
            //获取wNongliData(m)的第n个二进制位的值
            nBit = wNongliData[m];
            for(i=1;i<n+1;i++)
                nBit = nBit/2;
            
            nBit = nBit % 2;
            
            if (nTheDate <= (29 + nBit))
            {
                nIsEnd = 1;
                break;
            }
            
            nTheDate = nTheDate - 29 - nBit;
            n = n - 1;
        }
        if(nIsEnd)
            break;
        m = m + 1;
    }
    wCurYear = 1921 + m;
    wCurMonth = k - n + 1;
    wCurDay = nTheDate;
    if (k == 12)
    {
        if (wCurMonth == wNongliData[m] / 65536 + 1)
            wCurMonth = 1 - wCurMonth;
        else if (wCurMonth > wNongliData[m] / 65536 + 1)
            wCurMonth = wCurMonth - 1;
    }
    
    //生成农历天干、地支、属相
    NSString *szShuXiang = (NSString *)[cShuXiang objectAtIndex:((wCurYear - 4) % 60) % 12];
    NSString *szNongli = [NSString stringWithFormat:@"%@(%@%@)年",szShuXiang, (NSString *)[cTianGan objectAtIndex:((wCurYear - 4) % 60) % 10],(NSString *)[cDiZhi objectAtIndex:((wCurYear - 4) % 60) % 12]];
    
    //生成农历月、日
    NSString *szNongliDay;
    if (wCurMonth < 1){
        szNongliDay = [NSString stringWithFormat:@"闰%@",(NSString *)[cMonName objectAtIndex:-1 * wCurMonth]];
    }
    else{
        szNongliDay = (NSString *)[cMonName objectAtIndex:wCurMonth];
    }
    
    NSString *lunarDate = [NSString stringWithFormat:@"%@ %@月 %@",szNongli,szNongliDay,(NSString *)[cDayName objectAtIndex:wCurDay]];
    
    return lunarDate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
