//
//  LTSudukuGameView.h
//  LTSoduku
//
//  Created by lt on 2017/9/4.
//  Copyright © 2017年 tl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTSudukuGameView : UIView

- (void)restartGame;

- (void)timerCallBack:(NSTimer *)timer;

@end
