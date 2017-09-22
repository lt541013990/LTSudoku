//
//  LTSudokuToolButton.h
//  LTSoduku
//
//  Created by lt on 2017/9/22.
//  Copyright © 2017年 tl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTSudokuToolButton : UIButton

@property (nonatomic, assign) BOOL isNoted;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *noteTitle;

@property (nonatomic, strong) UIImage *ltBackgroundImage;

@end
