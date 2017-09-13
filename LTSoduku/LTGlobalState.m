//
//  LTGlobalState.m
//  LTSoduku
//
//  Created by lt on 2017/9/4.
//  Copyright © 2017年 tl. All rights reserved.
//

#import "LTGlobalState.h"

@implementation LTGlobalState

+ (UIColor *)selectedCellColor
{
    return RGBACOLOR(218, 238, 222, 0.5);
}

+ (UIColor *)selectedCellBorderColor
{
    return [UIColor flatRedColor];
}

+ (UIColor *)unSelectedCellColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)editableCellTextColor
{
    return [UIColor flatBlueColor];
}

+ (CGFloat)defaultTopSpace
{
    return 10.f;
}

+ (NSInteger)cellWidthHeight
{
    return (SCREEN_WIDTH - 20) / 9;
}

+ (CGFloat)sudokuViewWidth
{
    return [self cellWidthHeight] * 9;
}

+ (CGFloat)sudokuButtonSpace
{
    return 5.f;
}

+ (CGFloat)sudokuLayerWidth
{
    return .5f;
}


@end
