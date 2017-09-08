//
//  ViewController.m
//  LTSoduku
//
//  Created by lt on 2017/9/4.
//  Copyright © 2017年 tl. All rights reserved.
//

#import "ViewController.h"
#import "LTSudukuGameView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"数独";
    
    [LTSudokuLogic reStartGame];
    
    LTSudukuGameView *sudokuView = [[LTSudukuGameView alloc] initWithFrame:CGRectMake(0,[GState defaultTopSpace] + 64, self.view.width, self.view.height - 64)];
    [self.view addSubview:sudokuView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
