//
//  YQHelper.m
//  YQTableViewCellMenu
//
//  Created by chase on 16/2/3.
//  Copyright © 2016年 chase_liu. All rights reserved.
//

#import "YQHelper.h"

@implementation YQHelper

+ (UIButton *)createButtonWithTitle:(NSString *)title
//                              frame:(CGRect)frame
                             target:(id)target
                             target:(SEL)selector {
//    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 3.0f;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    button.backgroundColor = [UIColor redColor];
    return button;
}


@end
