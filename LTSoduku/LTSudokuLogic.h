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
@property (nonatomic, assign) NSTimeInterval bestTime;      /**< 最好成绩 */
@property (nonatomic, assign) NSTimeInterval gameTime;      /**< 当前游戏计时 */



+ (instancetype)sharedInstance;

+ (LTSodukuCellModel *)modelWithX:(NSInteger)x y:(NSInteger)y;

+ (NSString *)valueWithX:(NSInteger)x y:(NSInteger)y;

+ (void)restartGame;

+ (void)saveGameFileWithKey:(NSString *)key;

+ (BOOL)loadGameFileAndRestartWithKey:(NSString *)key;

+ (void)initGameData;

+ (BOOL)isGameOver;

+ (void)setGameLevel:(NSInteger)level;

@end
