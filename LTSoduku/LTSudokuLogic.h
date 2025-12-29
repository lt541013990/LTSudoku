//
//  LTSudokuLogic.h
//  LTSoduku
//
//  Created by lt on 2017/9/6.
//  Copyright © 2017年 tl. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GAMELEVEL @"gameLevel"


@class LTSodukuCellModel;

@interface LTSudokuLogic : NSObject

@property (nonatomic, assign) NSInteger gameLevel;          /**< 游戏等级 低 中 高 对应 0 1 2  默认低 */
@property (nonatomic, assign) NSInteger currentLevel;       /**< 当前关卡 1-20 */
@property (nonatomic, assign) NSInteger maxUnlockedLevel;   /**< 最高解锁关卡 */

+ (instancetype)sharedInstance;

+ (LTSodukuCellModel *)modelWithX:(NSInteger)x y:(NSInteger)y;

+ (NSString *)valueWithX:(NSInteger)x y:(NSInteger)y;

+ (void)restartGame;

+ (void)saveGameFileWithKey:(NSString *)key;

+ (BOOL)loadGameFileAndRestartWithKey:(NSString *)key;

+ (void)initGameData;

+ (BOOL)isGameOver;

+ (void)setGameLevel:(NSInteger)level;

// 关卡相关方法
+ (NSInteger)getCurrentLevel;
+ (void)setCurrentLevel:(NSInteger)level;
+ (NSInteger)getMaxUnlockedLevel;
+ (void)unlockNextLevel;
+ (NSInteger)getDifficultyForLevel:(NSInteger)level;
+ (NSString *)getLevelName:(NSInteger)level;

@end
