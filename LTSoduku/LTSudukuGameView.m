//
//  LTSudukuGameView.m
//  LTSoduku
//
//  Created by lt on 2017/9/4.
//  Copyright © 2017年 tl. All rights reserved.
//

#import "LTSudukuGameView.h"
#import "LTSudokuEditToolView.h"
#import "LTSudokuCollectionViewCell.h"

@interface LTSudukuGameView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *sudokuView;
@property (nonatomic, strong) LTSudokuEditToolView *toolView;

@end

@implementation LTSudukuGameView

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
    [self addSubview:self.sudokuView];
    [self addSubview:self.toolView];
}

- (void)layoutSubviews
{
    self.sudokuView.frame = CGRectMake([GState defaultTopSpace], -64, [GState sudokuViewWidth], [GState sudokuViewWidth] + 64);
    self.toolView.frame = CGRectMake(self.sudokuView.left, self.sudokuView.bottom + [GState defaultTopSpace], [GState sudokuViewWidth], 70);
}


# pragma mark - CollectionViewDatasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 9;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LTSudokuCollectionViewCell * cell = (LTSudokuCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.layer.borderWidth = .5f;
    [cell setModel:[LTSudokuLogic modelWithX:indexPath.section y:indexPath.row]];
    
    return cell;
}


# pragma mark CollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LTSudokuCollectionViewCell *selectedCell = (LTSudokuCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (selectedCell.layer.borderWidth == 1.5f) {
        [self collectionView:collectionView didDeselectItemAtIndexPath:indexPath];
        return;
    }
    
    NSInteger x = indexPath.section;
    NSInteger y = indexPath.row;
    NSString *highlightValue = @"000";
    if (selectedCell.model.inputValue.length > 0) {
        highlightValue = selectedCell.model.inputValue;
    } else if(selectedCell.model.editEnabled == NO) {
        highlightValue = selectedCell.model.realValue;
    }
    
    for (NSInteger i = 0; i < 9; i++) {
        for (NSInteger j = 0; j < 9; j++) {
            LTSudokuCollectionViewCell *cell = (LTSudokuCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
            if (i == x || j == y ) {
                cell.backgroundColor = [GState selectedCellColor];
            } else {
                cell.backgroundColor = [UIColor whiteColor];
                cell.layer.borderColor = [UIColor blackColor].CGColor;
            }
            
            if (highlightValue == (cell.model.editEnabled == YES ? cell.model.inputValue : cell.model.realValue)) {
                cell.backgroundColor = RGBACOLOR(248, 196, 113, .5f);
            }
            
        }
    }
    
    selectedCell.layer.borderColor = [GState selectedCellBorderColor].CGColor;
    selectedCell.layer.borderWidth = 1.5f;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    for (NSInteger i = 0; i < 9; i++) {
        for (NSInteger j = 0; j < 9; j++) {
            LTSudokuCollectionViewCell *cell = (LTSudokuCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
            cell.backgroundColor = [UIColor whiteColor];
            cell.layer.borderColor = [UIColor blackColor].CGColor;
            cell.layer.borderWidth = .5f;
        }
    }
//
//    LTSudokuCollectionViewCell *cell = (LTSudokuCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
//    cell.layer.borderWidth = .5f;
}

# pragma mark - get

- (UICollectionView *)sudokuView
{
    if (!_sudokuView)
    {
        UICollectionViewFlowLayout *viewLayout = [[UICollectionViewFlowLayout alloc] init];
        viewLayout.itemSize = CGSizeMake([GState cellWidthHeight], [GState cellWidthHeight]);
        viewLayout.minimumLineSpacing = 0;
        viewLayout.minimumInteritemSpacing = 0;
        _sudokuView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:viewLayout];
        _sudokuView.backgroundColor = [UIColor whiteColor];
        _sudokuView.delegate = self;
        _sudokuView.dataSource = self;
        [_sudokuView registerClass:[LTSudokuCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return _sudokuView;
}

- (LTSudokuEditToolView *)toolView
{
    if (!_toolView)
    {
        _toolView = [[LTSudokuEditToolView alloc] initWithFrame:CGRectZero];
    }
    return _toolView;
}

@end
