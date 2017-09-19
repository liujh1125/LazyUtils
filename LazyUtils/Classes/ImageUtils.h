//
//  ImageUtils.h
//  Pods
//
//  Created by 曾诗(外包) on 2017/9/18.
//
//

#import <Foundation/Foundation.h>

@interface ImageUtils : NSObject

#pragma mark  -----------------  生成二维码图片  ------------------
+(UIImage*)qrCodeImageForString:(NSString*)qrCodeStr imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize;


@end
