//
//  DrawVC.h
//  iColor
//
//  Created by YuhanHao on 15/11/13.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleColorNoSidebarViewController.h"
#import "SimpleColors.h"
#import "MyColorsVC.h"

@interface DrawVC : UIViewController {
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
-(void)changeColor:(NSString *)s;

@end
