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
    
    // 美化表格视图
    self.tableView.backgroundColor = [UIColor colorWithRed:0.95 green:0.97 blue:1.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
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
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
    
    // 添加卡片样式
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 10;
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(0, 2);
    cell.layer.shadowOpacity = 0.1;
    cell.layer.shadowRadius = 4;
    cell.layer.masksToBounds = NO;
    
    // 添加左边距和上下边距
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.contentView.layer.cornerRadius = 10;
    cell.contentView.layer.masksToBounds = YES;
    
    if (level == currentLevel) {
        cell.detailTextLabel.text = @"▶️ 当前";
        cell.detailTextLabel.textColor = [UIColor flatBlueColor];
        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.95 blue:1.0 alpha:1.0];
        cell.contentView.backgroundColor = cell.backgroundColor;
    } else if (level <= maxUnlockedLevel) {
        cell.detailTextLabel.text = @"✅ 已完成";
        cell.detailTextLabel.textColor = [UIColor flatGreenColor];
        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:15];
    } else {
        cell.detailTextLabel.text = @"🔒 未解锁";
        cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:15];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor flatGrayColor];
        cell.detailTextLabel.textColor = [UIColor flatGrayColor];
        cell.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
        cell.contentView.backgroundColor = cell.backgroundColor;
    }
    
    return cell;
}

# pragma mark - tableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;  // 增加行高
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger level = indexPath.row + 1;
    NSInteger maxUnlockedLevel = [LTSudokuLogic getMaxUnlockedLevel];
    
    // 只能选择已解锁的关卡
    if (level <= maxUnlockedLevel) {
        [LTSudokuLogic setCurrentLevel:level];
        [self.tableView reloadData];
        
        // 添加选择动画
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [UIView animateWithDuration:0.1 animations:^{
            cell.transform = CGAffineTransformMakeScale(0.95, 0.95);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                cell.transform = CGAffineTransformIdentity;
            }];
        }];
    }
}

# pragma mark - lazy get


@end
