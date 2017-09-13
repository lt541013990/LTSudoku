//
//  LTSudokuCollectionViewCell.h
//  LTSoduku
//
//  Created by lt on 2017/9/5.
//  Copyright © 2017年 tl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LTSodukuCellModel.h"

@interface LTSudokuCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) LTSodukuCellModel *model;

@property (nonatomic, strong) CALayer *borderLayer;

@end
