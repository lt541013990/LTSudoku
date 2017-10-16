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

@property (nonatomic, strong) LTSudukuGameView *sudokuView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"数独";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.sudokuView = [[LTSudukuGameView alloc] initWithFrame:CGRectMake(0,[GState defaultTopSpace] + 64, self.view.width, self.view.height - 64)];
    [self.view addSubview:self.sudokuView];
    
    if (![LTSudokuLogic loadGameFileAndRestartWithKey:LASTGAMEDATA]) {
        [self restartGame];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(restartGame) name:LTGAMERESTART object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshGame) name:LTGAMEREFRESH object:nil];
    [[NSRunLoop currentRunLoop] addTimer:self.LTSudokuTimer forMode:NSRunLoopCommonModes];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)restartGame
{
    [LTSudokuLogic initGameData];
    [self.sudokuView restartGame];
}

- (void)refreshGame
{
    [self.sudokuView restartGame];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.LTSudokuTimer setFireDate:[NSDate date]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.LTSudokuTimer setFireDate:[NSDate distantFuture]];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LTGAMERESTART object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LTGAMEREFRESH object:nil];
}

- (NSTimer *)LTSudokuTimer
{
    if (!_LTSudokuTimer)
    {
        _LTSudokuTimer = [NSTimer timerWithTimeInterval:1.f target:self.sudokuView selector:@selector(timerCallBack:) userInfo:nil repeats:YES];
    }
    return _LTSudokuTimer;
}

@end
