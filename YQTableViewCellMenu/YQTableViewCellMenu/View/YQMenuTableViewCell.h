//
//  YQMenuTableViewCell.h
//  YQTableViewCellMenu
//
//  Created by chase on 16/1/22.
//  Copyright © 2016年 chase_liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YQMenuTableViewCellDelete;
@protocol YQMenuTableViewCellDateSource;

@interface YQMenuTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *showMenuButton;
@property (nonatomic, strong) UIView *menuView;
@property (nonatomic, strong) id <YQMenuTableViewCellDelete> delegate;
@property (nonatomic, strong) id <YQMenuTableViewCellDateSource> dataSource;

@property (nonatomic, assign) BOOL isOpenCell;

@end

@protocol YQMenuTableViewCellDateSource <NSObject>

@required
- (NSMutableArray *)dataSourceForMenuItem;

@end

@protocol YQMenuTableViewCellDelete <NSObject>

@optional
- (void)didOpenMenu:(YQMenuTableViewCell *)menuCell withMoreButton:(UIButton *)moreButton;
- (void)menuTableViewCell:(YQMenuTableViewCell *)menuCell didSelectedMenuItemAtIndex:(NSInteger)menuItemIndex;

@end