//
//  LTSodukuCellModel.h
//  LTSoduku
//
//  Created by lt on 2017/9/5.
//  Copyright © 2017年 tl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTSodukuCellModel : NSObject <NSCoding>

@property (nonatomic, assign) BOOL editEnabled;

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

@property (nonatomic, copy) NSString *inputValue;
@property (nonatomic, copy) NSString *realValue;

@property (nonatomic, strong) NSMutableArray *valistValueList;      /**< 初始化时可供选择的点 */
@property (nonatomic, strong) NSMutableArray *noteList;

@end
