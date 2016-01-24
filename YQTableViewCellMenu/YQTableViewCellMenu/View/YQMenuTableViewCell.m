//
//  YQMenuTableViewCell.m
//  YQTableViewCellMenu
//
//  Created by chase on 16/1/22.
//  Copyright © 2016年 chase_liu. All rights reserved.
//

#import "YQMenuTableViewCell.h"
#define YQWidth [UIScreen mainScreen].bounds.size.width

@implementation YQMenuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.layer.masksToBounds = YES;
        self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 50, 50)];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_headerImageView.frame.origin.x + _headerImageView.frame.size.width + 8, 8, 180, 30)];
        self.showMenuButton = [[UIButton alloc] initWithFrame:CGRectMake(YQWidth - 53, 21, 25, 25)];
        [_showMenuButton addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
        self.menuView = [[UIView alloc] initWithFrame:CGRectMake(8, _headerImageView.frame.origin.y + _headerImageView.frame.size.height + 8, YQWidth - 16, 40)];
        
        [self addSubview:_headerImageView];
        [self addSubview:_titleLabel];
        [self addSubview:_showMenuButton];
        [self addSubview:_menuView];
        
    }
    return self;
}

- (void)moreClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didOpenMenu:withMoreButton:)]) {
        [self.delegate didOpenMenu:self withMoreButton:sender];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
