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
@property (nonatomic, strong) NSMutableArray *noteLabelArray;

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
    for (UILabel *label in self.noteLabelArray) {
        [self.contentView addSubview:label];
    }
}

- (void)layoutSubviews
{
    self.valueLabel.frame = self.contentView.bounds;
    for (NSInteger i = 0; i < 9; i++) {
        UILabel *label = self.noteLabelArray[i];
        [label sizeToFit];
        label.left = (self.contentView.width - label.width - 4) / 2 * (i % 3) + 2;
        label.top = (self.contentView.height - label.height - 4) / 2 * (i / 3) + 2;
    }
}

# pragma mark - set


- (void)setModel:(LTSodukuCellModel *)model
{
    _model = model;
    self.valueLabel.textAlignment = NSTextAlignmentCenter;
    self.valueLabel.textColor = self.model.editEnabled == YES ? [GState editableCellTextColor] : [UIColor blackColor];
    self.valueLabel.font = [UIFont systemFontOfSize:15];
    self.valueLabel.text = self.model.editEnabled == YES ? model.inputValue : model.realValue;
    
    if (model.inputValue.length == 0 && model.noteList.count > 0) {
        for (UILabel *label in self.noteLabelArray) {
            for (NSString *noteValue in model.noteList) {
                if ([label.text isEqualToString:noteValue]) {
                    label.hidden = NO;
                    break;
                } else {
                    label.hidden = YES;
                }
            }
        }
    } else {
        for (UILabel *label in self.noteLabelArray) {
            label.hidden = YES;
        }
    }
}


# pragma mark - get

- (UILabel *)valueLabel
{
    if (!_valueLabel)
    {
        _valueLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _valueLabel.numberOfLines = 3;
    }
    return _valueLabel;
}

- (NSMutableArray *)noteLabelArray
{
    if (!_noteLabelArray)
    {
        _noteLabelArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 9 ; i++) {
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:10];
            label.text = [NSString stringWithFormat:@"%ld",(long)i + 1];
            label.hidden = YES;
            [_noteLabelArray addObject:label];
        }
    }
    return _noteLabelArray;
}

@end

