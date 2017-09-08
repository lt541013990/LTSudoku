//
//  LTSudokuCollectionViewCell.m
//  LTSoduku
//
//  Created by lt on 2017/9/5.
//  Copyright © 2017年 tl. All rights reserved.
//

#import "LTSudokuCollectionViewCell.h"

@interface LTSudokuCollectionViewCell ()

@property (nonatomic, strong) UILabel *valueLabel;

@end

@implementation LTSudokuCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

# pragma mark - ui

- (void)initView
{
    [self.contentView addSubview:self.valueLabel];
}

- (void)layoutSubviews
{
    self.valueLabel.frame = self.contentView.bounds;
}

# pragma mark - set


- (void)setModel:(LTSodukuCellModel *)model
{
    _model = model;
    self.valueLabel.textAlignment = NSTextAlignmentCenter;
    self.valueLabel.textColor = self.model.editEnabled == YES ? [GState editableCellTextColor] : [UIColor blackColor];
    self.valueLabel.font = [UIFont systemFontOfSize:13];
    self.valueLabel.text = self.model.editEnabled == YES ? model.inputValue : model.realValue;
    
    if (model.inputValue.length == 0 && model.noteList.count > 0) {
        NSString *value = @"";
        for (NSString *str in model.noteList) {
            value = [NSString stringWithFormat:@"%@  %@", value, str];
        }
        self.valueLabel.text = value;
        self.valueLabel.font = [UIFont systemFontOfSize:10];
        self.valueLabel.textColor = [UIColor flatRedColor];
        self.valueLabel.textAlignment = NSTextAlignmentCenter;
    }
}


# pragma mark - get

- (UILabel *)valueLabel
{
    if (!_valueLabel)
    {
        _valueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _valueLabel;
}

@end

