//
//  UIColor+UIColorExtend.m
//  etionLib
//
//  Created by wu jingxing on 12-6-20.
//  Copyright (c) 2012年 GuangZhouXuanWu. All rights reserved.
//

#import "UIColorExtend.h"

@implementation UIColor (UIColorExtend)

+(UIColor*)colorWithRGBString:(NSString*)szRGB
{
    return [UIColor colorWithRGBAString:[NSString stringWithFormat:@"%@,1",szRGB]];
}

+(UIColor*)colorWithRGBAString:(NSString*)szRGBA
{
    NSArray* ar=[szRGBA componentsSeparatedByString:@","]; 
    return [UIColor colorWithR:[[ar objectAtIndex:0]floatValue] G:[[ar objectAtIndex:1]floatValue] B:[[ar objectAtIndex:2]floatValue] A:[[ar objectAtIndex:3]floatValue]];
}

+(UIColor*)colorWithR:(CGFloat)nR G:(CGFloat)nG B:(CGFloat)nB A:(CGFloat)nA
{
    return [UIColor colorWithRed:nR/255.0 green:nG/255.0 blue:nB/255.0 alpha:nA];
}

+(UIColor*)colorWithHex:(NSUInteger)color
{
    return [UIColor colorWithHex:color alpha:1.0];
}

+(UIColor*)colorWithHex:(NSUInteger)color alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((color & 0xff0000) >> 16) / 255.0f
                           green:((color & 0xff00) >> 8) / 255.0f
                            blue:(color & 0xff) / 255.0f
                           alpha:alpha];
}

+(UIColor*)colorWithHexString:(NSString*)hexString
{
    NSString *valueString = hexString;
    valueString = [valueString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if ([valueString hasPrefix:@"0x"])
    {
        valueString = [hexString substringFromIndex:2];
    }
    if (valueString.length != 8 && valueString.length != 6)
    {
        return nil;
    }
    
    unsigned color = 0;
    unsigned alpha = 255;
    if (valueString.length == 6)
    {
        NSScanner *scanner = [NSScanner scannerWithString:valueString];
        [scanner scanHexInt:&color];
    }
    else
    {
        NSScanner *scanner = [NSScanner scannerWithString:[valueString substringToIndex:6]];
        [scanner scanHexInt:&color];
        scanner = [NSScanner scannerWithString:[valueString substringFromIndex:6]];
        [scanner scanHexInt:&alpha];
    }
    
    return [UIColor colorWithHex:color alpha:alpha/255.0f];
}

+ (UIColor *)flatBlueColor
{
    return [UIColor colorWithHex:0x4998d2];
}

+ (UIColor *)flatLightBlueColor
{
    return [UIColor colorWithHex:0xC6E2FF];
}

+ (UIColor *)flatDarkBlueColor
{
    return [UIColor colorWithHex:0x2980B9];
}

+ (UIColor *)flatRedColor
{
    return [UIColor colorWithHex:0xE74C3C];
}

+ (UIColor *)flatDarkRedColor
{
    return [UIColor colorWithHex:0xC0392B];
}

+ (UIColor *)flatGreenColor
{
    return [UIColor colorWithHex:0x27AE60];
}

+ (UIColor *)flatBlackColor
{
    return [UIColor colorWithHex:0x4c4c4c];
}

+ (UIColor *)flatGrayColor
{
    return [UIColor colorWithHex:0xb2b2b2];
}

+ (UIColor *)flatLightGrayColor
{
    return [UIColor colorWithHex:0xdedede];
}

+ (UIColor *)brighterColorWithColor:(UIColor *)color
{
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    
    CGFloat baseValue = MAX(r, MAX(g, b));
    CGFloat brightRate = (1.0-baseValue)*0.5/baseValue;
    r += r*brightRate;
    g += g*brightRate;
    b += b*brightRate;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

+ (UIColor *)lighterColorWithColor:(UIColor *)color
{
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    
    CGFloat lightRate = 0.85;
    r += (1.0-r)*lightRate;
    g += (1.0-g)*lightRate;
    b += (1.0-b)*lightRate;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
