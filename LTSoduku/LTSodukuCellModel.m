//
//  LTSodukuCellModel.m
//  LTSoduku
//
//  Created by lt on 2017/9/5.
//  Copyright © 2017年 tl. All rights reserved.
//

#import "LTSodukuCellModel.h"

@implementation LTSodukuCellModel

- (instancetype)init
{
    if (self = [super init]) {
        self.noteList = [NSMutableArray array];
        self.valistValueList = [NSMutableArray array];
    }
    return self;
}

@end
