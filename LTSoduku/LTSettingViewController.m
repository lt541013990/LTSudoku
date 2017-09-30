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
    self.navigationItem.title = @"设置";
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

# pragma mark - private


# pragma mark - public



# pragma mark - tableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.row) {
        case 0:     // 难度选择
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"settingCell"];
            cell.textLabel.text = @"难度";
            cell.detailTextLabel.text = @"1";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
            
        default:
            break;
    }
    
    return cell;
}

# pragma mark - tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:     // 难度选择
        {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"难度选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

            [alertVC addAction:[UIAlertAction actionWithTitle:@"低级" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [LTSudokuLogic setGameLevel:0];
            }]];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"中级" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [LTSudokuLogic setGameLevel:1];
            }]];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"高级" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [LTSudokuLogic setGameLevel:2];
            }]];
            [self presentViewController:alertVC animated:NO completion:nil];
            break;
        }
            
        default:
            break;
    }
}

@end
