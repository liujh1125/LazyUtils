//
//  UIKitUtils.m
//  MLPlayer
//
//  Created by 曾诗(外包) on 2017/9/5.
//  Copyright © 2017年 w. All rights reserved.
//

#import "UIKitUtils.h"



@implementation UIKitUtils

NSString *rmNull(id value){
    if (!value) {
        return @"";
    }else if ([value isKindOfClass:[NSString class]]){

        if ([[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
            return @"";
        }
        if ([value isEqualToString:@"<null>"]) {
            return @"";
        }
        if ([value isEqualToString:@"null"]) {
            return @"";
        }
        if ([value isEqualToString:@"(null)"]) {
            return @"";
        }
    }else{
        
        return [NSString stringWithFormat:@"%@",value];
    }
    return value;
}

@end


@implementation NSDictionary (Ext)

-(id)keywords_filter:(id)result{
    if ([result isKindOfClass:[NSString class]]) {
        return result;
    }
    if ([result isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray array];
        for (id arrObj in result) {
            [array addObject:arrObj];
            if ([arrObj isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dict = (NSDictionary*)arrObj;
                [array removeObject:arrObj];
                [array addObject:[self keywords_filter:dict]];
            }
        }
        return array;
    }
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = (NSMutableDictionary*)result;
        
        NSMutableDictionary *newDic = [NSMutableDictionary dictionary];
        for (NSString *dicKey in dict.allKeys) {
            [newDic setObject:dict[dicKey] forKey:dicKey];
            
            if ([dicKey isEqualToString:@"id"]) {
                [newDic setObject:dict[dicKey] forKey:@"id_a"];
            }
            if ([dicKey isEqualToString:@"description"]) {
                [newDic setObject:dict[dicKey] forKey:@"description_a"];
            }
            if ([dicKey isEqualToString:@"friend"]) {
                [newDic setObject:dict[dicKey] forKey:@"friend_a"];
            }
            
            if ([dict[dicKey] isKindOfClass:[NSArray class]]) {
                newDic[dicKey] = [self keywords_filter:dict[dicKey]];
            }
            if ([dict[dicKey] isKindOfClass:[NSDictionary class]]) {
                newDic[dicKey] = [self keywords_filter:dict[dicKey]];
            }
        }
        return newDic;
    }
    
    return result;
}

@end


@implementation NSString (Ext)

-(NSString*)rmNull{

    if (self == nil || self == NULL) {
        return @"";
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return @"";
    }
    if ([self isEqualToString:@"<null>"]) {
        return @"";
    }
    if ([self isEqualToString:@"null"]) {
        return @"";
    }
    if ([self isEqualToString:@"(null)"]) {
        return @"";
    }
    return self;
}


-(double)boundsHeight:(CGFloat)fontSize size:(CGSize)aSize spacing:(CGFloat)lineSpacing{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attrsDt =@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle};
    CGRect aRect = [self boundingRectWithSize:aSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrsDt context:nil];
    double aHeight = ceil(aRect.size.height);
    
    if (aHeight < 20) {
        aHeight = 20;
    }
    return aHeight;
}


@end

@implementation UIView (NewExt)

+(UILabel*)Label:(NSString*)lStr rect:(CGRect)frame font:(UIFont*)fnt txColor:(UIColor*)txColor align:(NSTextAlignment)align{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = lStr;
    label.font = fnt;
    label.textColor = txColor;
    label.textAlignment = align;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    
    return label;
}

+(UIButton*)button:(NSString*)title rect:(CGRect)frame font:(UIFont*)fnt tColor:(UIColor*)tColor image:(UIImage*)image target:(id)delegate action:(SEL)selecter{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:tColor forState:UIControlStateNormal];
    button.titleLabel.font = fnt;
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:delegate action:selecter forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIView*)view:(CGRect)frame bgColor:(UIColor*)bgColor{
    UIView *bView = [[UIView alloc] initWithFrame:frame];
    bView.backgroundColor = bgColor;
    return bView;
}

+(UIScrollView*)scrollv:(CGRect)frame bgColor:(UIColor*)bgColor delegate:(id)adelegate{
    UIScrollView *scrollv = [[UIScrollView alloc] initWithFrame:frame];
    scrollv.backgroundColor = bgColor;
    scrollv.delegate = adelegate;
    
    return scrollv;
}

+(UIImageView*)imageV:(UIImage*)image rect:(CGRect)frame{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:frame];
    imgV.image = image;
    return imgV;
}

+(UIImageView *)imageVWithColor:(UIColor*)imgCol frame:(CGRect)aRect{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:aRect];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage initWithColor:imgCol frame:aRect.size];
    return imageView;
}

-(void)border:(UIColor*)color borderW:(CGFloat)borderw{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderw;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

+(UITableView *)tableWithRect:(CGRect)frame style:(UITableViewStyle)style backgroundColor:(UIColor *)backgroundColor delegate:(id)delegate separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView setBackgroundColor:backgroundColor];
    [tableView setDelegate:delegate];
    [tableView setDataSource:delegate];
    [tableView setSeparatorStyle:separatorStyle];
    
    return tableView;
}


+(UITextField*)textFieldWithRect:(CGRect)rect target:(id)target textColor:(UIColor*)aTextColor placeHolder:(NSString*)holder returnKey:(UIReturnKeyType)returnKeyType keyBord:(UIKeyboardType)keyBord{
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    textField.backgroundColor = [UIColor clearColor];
    textField.delegate = target;
    textField.returnKeyType = returnKeyType;
    textField.keyboardType = keyBord;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.borderStyle = UITextBorderStyleNone;
    textField.textColor = aTextColor;
    textField.placeholder = holder;
    
    return textField;
}


@end


@implementation UIImage (ext)

+(UIImage*)initWithColor:(UIColor*)color frame:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width,size.height));
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize{
    
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}



@end
