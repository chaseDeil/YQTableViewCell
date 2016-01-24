//
//  ViewController.m
//  YQTableViewCellMenu
//
//  Created by chase on 16/1/22.
//  Copyright © 2016年 chase_liu. All rights reserved.
//

#import "ViewController.h"
#import "YQMenuTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, YQMenuTableViewCellDateSource, YQMenuTableViewCellDelete>

@property (nonatomic, strong) YQMenuTableViewCell *openMenuCell;
@property (nonatomic, strong) NSIndexPath *openMenuCellIndex;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableArray;
@property (nonatomic, strong) NSMutableArray *menuDataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YQTableViewCellDemo";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.tableArray = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", @"", nil];
    self.menuDataArray = [NSMutableArray arrayWithObjects:@"", @"", @"", @"", @"", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((self.openMenuCell != nil)&&
        (self.openMenuCell.isOpenCell = YES)&&
        (self.openMenuCellIndex.row == indexPath.row))
    {
        return 106.0;
    }else
    {
        return 66.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YQMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[YQMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.delegate = self;
    cell.dataSource = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.headerImageView.backgroundColor = [UIColor redColor];
    cell.titleLabel.backgroundColor = [UIColor grayColor];
    cell.showMenuButton.backgroundColor = [UIColor orangeColor];
    cell.menuView.backgroundColor = [UIColor blackColor];
    cell.showMenuButton.tag = indexPath.row + 1;
    
    return cell;
}

#pragma mark - YQCellDelegate && dataSource
- (void)didOpenMenu:(YQMenuTableViewCell *)menuCell withMoreButton:(UIButton *)moreButton
{
    NSIndexPath *openIndexPath = [NSIndexPath indexPathForRow:(moreButton.tag - 1) inSection:0];
    if ((self.openMenuCell != nil) && (self.openMenuCell.isOpenCell = YES) && (self.openMenuCellIndex = openIndexPath)) {
        self.openMenuCell = nil;
        [self.tableView reloadRowsAtIndexPaths:@[self.openMenuCellIndex] withRowAnimation:UITableViewRowAnimationNone];
        self.openMenuCellIndex = nil;
        return;

    }
    self.openMenuCell = menuCell;
    self.openMenuCellIndex = openIndexPath;
    [self.tableView reloadRowsAtIndexPaths:@[self.openMenuCellIndex] withRowAnimation:UITableViewRowAnimationNone];
    [_tableView scrollToRowAtIndexPath:_openMenuCellIndex atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (NSMutableArray *)dataSourceForMenuItem
{
    return _menuDataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
