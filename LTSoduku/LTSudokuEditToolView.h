//
//  LTSudokuEditToolView.h
//  LTSoduku
//
//  Created by lt on 2017/9/7.
//  Copyright © 2017年 tl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LTSudokuEditToolViewDelegate <NSObject>

- (void)setInputValue:(NSString *)value;

- (void)setNoteValue:(NSString *)value;

@end

@interface LTSudokuEditToolView : UIView

@property (nonatomic, weak) id<LTSudokuEditToolViewDelegate> delegate;


@end
