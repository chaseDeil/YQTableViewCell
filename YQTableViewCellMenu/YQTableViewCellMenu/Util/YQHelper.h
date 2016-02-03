//
//  YQHelper.h
//  YQTableViewCellMenu
//
//  Created by chase on 16/2/3.
//  Copyright © 2016年 chase_liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YQHelper : NSObject

+ (UIButton *)createButtonWithTitle:(NSString *)title
//                              frame:(CGRect)frame
                             target:(id)target
                             target:(SEL)selector;

@end
