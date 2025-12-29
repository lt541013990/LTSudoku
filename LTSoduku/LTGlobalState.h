//
//  LTGlobalState.h
//  LTSoduku
//
//  Created by lt on 2017/9/4.
//  Copyright © 2017年 tl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define GState LTGlobalState
#define LTGAMERESTART @"gameRestart"
#define LTGAMEREFRESH @"gameRefresh"

#define LASTGAMEDATA @"lastGameData"    // 退出自动保存的游戏数据
#define USERGAMEDATA @"userGameData"    // 用户手动存档数据
#define CURRENTLEVEL @"currentLevel"    // 当前关卡
#define MAXUNLOCKEDLEVEL @"maxUnlockedLevel"    // 最高解锁关卡
#define MAXLEVEL 20                     // 最大关卡数


@interface LTGlobalState : NSObject

+ (UIColor *)selectedCellColor;

+ (UIColor *)selectedCellBorderColor;

+ (UIColor *)unSelectedCellColor;

+ (UIColor *)editableCellTextColor;

+ (CGFloat)defaultTopSpace;

+ (NSInteger)cellWidthHeight;                 /**< cell的宽高度  相同 */

+ (CGFloat)sudokuViewWidth;

+ (CGFloat)sudokuButtonSpace;

+ (CGFloat)sudokuLayerWidth;

@end
