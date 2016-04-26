//
//  PublicFunctions.h
//  ORGUM
//
//  Created by Sun jishuai on 15/9/29.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, dataType){
    getData = 0 ,//获取
    setData = 1,//存储
};
@interface PublicFunctions : NSObject
//单例化
+ (PublicFunctions *)sharedPublicFunctions;
//001 HexColor转化为iOS颜色数组或数值string
- (UIColor *)colorForHex:(NSString *)hexColor;
//002 判断字符串是否为空
- (BOOL) isBlankString:(NSString *)string;
//003 判断是否是手机号码
- (BOOL) isPhoneNumber:(NSString *)phone;
//004 判断是否是电话号码
- (BOOL) isTelNumber:(NSString *)tel;
//005 load Image from caches dir or Documents to imageview
- (NSData*)loadImageDataWithPath:(NSString *) directoryPath andName: (NSString *)imageName;
//006 get file from caches dir or Documents
- (BOOL)getFileWithPath:(NSString *) directoryPath andName: (NSString *)fileName;
//007 判断密码是否有数字和字符组成
- (BOOL) isIncludeNumberAndChar:(NSString *)password;
//008 判断密码是否只有数字组成
- (BOOL) isJuestIncludeNumber:(NSString *)password;
// 009 除去字符串中的符号
- (NSString *)deleteCharactersOfstring:(NSString *)str;
// 009 处理时间戳的显示
- (NSString *)editDate:(double)idate;
// 013将时间戳转换成时间 -- 已经处理了与服务器的时间戳偏差
/*
 type: 0  --  yyyy-MM-dd HH:mm:ss
 type: 1  --  yyyy-MM-dd HH:mm
 type: 2  --  HH:mm
 */
-(NSString *)dateTimeToString:(double)dateTime Type:(int)type;
//19 获取当前时间戳
- (double)getDateTime_Now;
- (NSString *)getDateString_Now;


//102 根据不同的附件类型显示图标
//- (void)showAnnexWith:(UIImageView *)imgView FileName:(NSString *)fileName FilePath:(NSString *)filePath;
// 获取文件的类型
- (int)getTypeOfFileName:(NSString *)fileName;
@end
