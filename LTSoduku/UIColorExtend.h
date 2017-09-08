//
//  UIColor+UIColorExtend.h
//  etionLib
//
//  Created by wu jingxing on 12-6-20.
//  Copyright (c) 2012年 GuangZhouXuanWu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface UIColor (UIColorExtend)

+ (UIColor *)colorWithRGBString:(NSString *)szRGB;

+ (UIColor *)colorWithRGBAString:(NSString *)szRGBA;

+(UIColor*)colorWithR:(CGFloat)nR G:(CGFloat)nG B:(CGFloat)nB A:(CGFloat)nA;

+ (UIColor *)colorWithHex:(NSUInteger)color;

+(UIColor*)colorWithHex:(NSUInteger)color alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)flatBlueColor;
+ (UIColor *)flatLightBlueColor;
+ (UIColor *)flatDarkBlueColor;
+ (UIColor *)flatRedColor;
+ (UIColor *)flatDarkRedColor;
+ (UIColor *)flatGreenColor;
+ (UIColor *)flatBlackColor;
+ (UIColor *)flatGrayColor;
+ (UIColor *)flatLightGrayColor;

+ (UIColor *)brighterColorWithColor:(UIColor *)color;

+ (UIColor *)lighterColorWithColor:(UIColor *)color;

@end
