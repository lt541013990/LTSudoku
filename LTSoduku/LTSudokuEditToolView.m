//
//  LTSudokuEditToolView.m
//  LTSoduku
//
//  Created by lt on 2017/9/7.
//  Copyright © 2017年 tl. All rights reserved.
//

#import "LTSudokuEditToolView.h"

@interface LTSudokuEditToolView ()

@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation LTSudokuEditToolView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    
    return self;
}

- (void)initView
{
    for (NSInteger i = 0; i < 9; i++) {
        UIButton *button = [self editButtonWithTitle:[NSString stringWithFormat:@"%ld",i + 1]];
        [button addTarget:self action:@selector(editButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        [self.buttonArray addObject:button];
    }
    
    UIButton *button = [self editButtonWithTitle:@"X"];
    [self addSubview:button];
    [self.buttonArray addObject:button];
    
    button = [self editButtonWithTitle:@"标签"];
    [button setTitle:@"标签ing" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(switchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [self.buttonArray addObject:button];
}

- (void)layoutSubviews
{
    CGFloat buttonWidth = (self.width - [GState sudokuButtonSpace] * 5) / 6.5;
    
    for (UIButton *button in self.buttonArray) {
        NSInteger index = [self.buttonArray indexOfObject:button];
        if (10 == [self.buttonArray indexOfObject:button]) {
            button.top = 0;
            button.right = self.width;
            button.size = CGSizeMake(buttonWidth * 1.5, buttonWidth * 2 + [GState sudokuButtonSpace]);
            break;
        }
        
        button.frame = CGRectMake(index % 5 * (buttonWidth + [GState sudokuButtonSpace]), index / 5 * (buttonWidth + [GState sudokuButtonSpace]), buttonWidth, buttonWidth);
    }
}

- (UIButton *)editButtonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:25]];
    [button setBackgroundColor:[UIColor flatGrayColor]];
    
    return button;
}

# pragma mark - action
- (void)editButtonClicked:(UIButton *)button
{
    UIButton *switchButton = [self.buttonArray lastObject];
    
    if (switchButton.selected) {    // 选中状态就是添加note模式
        if ([self.delegate respondsToSelector:@selector(setNoteValue:)]) {
            [self.delegate setNoteValue:button.titleLabel.text];
        }
    } else {                        // 未选中则是添加输入的值
        if ([self.delegate respondsToSelector:@selector(setInputValue:)]) {
            [self.delegate setInputValue:button.titleLabel.text];
        }
    }
    
}

- (void)switchButtonClicked
{
    UIButton *switchButton = [self.buttonArray lastObject];
    
    if (switchButton.selected) {
        switchButton.selected = NO;
        
    } else {
        switchButton.selected = YES;
    }
}

# pragma mark - get

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray)
    {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

@end
