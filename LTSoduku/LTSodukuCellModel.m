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

# pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:self.editEnabled forKey:@"model_editEnabled"];
    [aCoder encodeInteger:self.x forKey:@"model_x"];
    [aCoder encodeInteger:self.y forKey:@"model_y"];
    [aCoder encodeObject:self.inputValue forKey:@"model_inputValue"];
    [aCoder encodeObject:self.realValue forKey:@"model_realValue"];
    [aCoder encodeObject:self.valistValueList forKey:@"model_valistValueList"];
    [aCoder encodeObject:self.noteList forKey:@"model_noteList"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    LTSodukuCellModel *model = [[LTSodukuCellModel alloc] init];
    model.editEnabled = [aDecoder decodeBoolForKey:@"model_editEnabled"];
    model.x = [aDecoder decodeIntegerForKey:@"model_x"];
    model.y = [aDecoder decodeIntegerForKey:@"model_y"];
    model.inputValue = [aDecoder decodeObjectForKey:@"model_inputValue"];
    model.realValue = [aDecoder decodeObjectForKey:@"model_realValue"];
    model.valistValueList = [aDecoder decodeObjectForKey:@"model_valistValueList"];
    model.noteList = [aDecoder decodeObjectForKey:@"model_noteList"];
    
    return model;
}

@end
