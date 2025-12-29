//
//  LTSettingViewController.m
//  LTSoduku
//
//  Created by lt on 2017/9/28.
//  Copyright © 2017年 tl. All rights reserved.
//

#import "LTSettingViewController.h"

@interface LTSettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation LTSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择关卡";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"settingCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

# pragma mark - private
- (IBAction)confirmBtnClicked:(id)sender
{
    [LTSudokuLogic restartGame];
    [self.navigationController popViewControllerAnimated:YES];
}

# pragma mark - public



# pragma mark - tableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return MAXLEVEL;  // 关卡总数
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"settingCell"];
    
    NSInteger level = indexPath.row + 1;
    NSInteger currentLevel = [LTSudokuLogic getCurrentLevel];
    NSInteger maxUnlockedLevel = [LTSudokuLogic getMaxUnlockedLevel];
    
    cell.textLabel.text = [LTSudokuLogic getLevelName:level];
    
    if (level == currentLevel) {
        cell.detailTextLabel.text = @"当前";
        cell.detailTextLabel.textColor = [UIColor flatBlueColor];
    } else if (level <= maxUnlockedLevel) {
        cell.detailTextLabel.text = @"已完成";
        cell.detailTextLabel.textColor = [UIColor flatGreenColor];
    } else {
        cell.detailTextLabel.text = @"🔒";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor flatGrayColor];
    }
    
    return cell;
}

# pragma mark - tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger level = indexPath.row + 1;
    NSInteger maxUnlockedLevel = [LTSudokuLogic getMaxUnlockedLevel];
    
    // 只能选择已解锁的关卡
    if (level <= maxUnlockedLevel) {
        [LTSudokuLogic setCurrentLevel:level];
        [self.tableView reloadData];
    }
}

# pragma mark - lazy get


@end
