//
//  UIKitUtils.h
//  MLPlayer
//
//  Created by 曾诗(外包) on 2017/9/5.
//  Copyright © 2017年 w. All rights reserved.
//

#import <Foundation/Foundation.h>



#define  NSStr(str)                [NSString stringWithFormat:@"%@",str]
#define  NSStrKV(key,value)          [NSString stringWithFormat:@"%@%@",key,value]
#define  sysFontSize(size)         [UIFont systemFontOfSize:size]
#define  bSysFontSize(size)        [UIFont boldSystemFontOfSize:size]
#define  XIBLoad(xibName)          [[[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil] firstObject]

@interface UIKitUtils : NSObject

NSString *rmNull(id value);

@end

@interface NSDictionary (Ext)

-(id)keywords_filter:(id)result;   // 关键字替换名字

@end

#pragma mark  NSString  category
@interface NSString (Ext)

-(NSString*)rmNull;

// 计算字符的高度
-(double)boundsHeight:(CGFloat)fontSize size:(CGSize)aSize spacing:(CGFloat)lineSpacing;

@end


#pragma mark  UIView  category
@interface UIView (NewExt)


+(UILabel*)Label:(NSString*)lStr rect:(CGRect)frame font:(UIFont*)fnt txColor:(UIColor*)txColor align:(NSTextAlignment)align;
+(UIButton*)button:(NSString*)title rect:(CGRect)frame font:(UIFont*)fnt tColor:(UIColor*)tColor image:(UIImage*)image target:(id)delegate action:(SEL)selecter;
+(UIView*)view:(CGRect)frame bgColor:(UIColor*)bgColor;
+(UIScrollView*)scrollv:(CGRect)frame bgColor:(UIColor*)bgColor delegate:(id)adelegate;
+(UIImageView*)imageV:(UIImage*)image rect:(CGRect)frame;
+(UIImageView*)imageVWithColor:(UIColor*)imgCol frame:(CGRect)aRect;

-(void)border:(UIColor*)color borderW:(CGFloat)borderw;


+(UITableView *)tableWithRect:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor delegate:(id)delegate separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;
+(UITextField*)textFieldWithRect:(CGRect)rect target:(id)target textColor:(UIColor*)aTextColor placeHolder:(NSString*)holder returnKey:(UIReturnKeyType)returnKeyType keyBord:(UIKeyboardType)keyBord;



@end



@interface UIImage (ext)

+(UIImage*)initWithColor:(UIColor*)color frame:(CGSize)size;
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

@end

