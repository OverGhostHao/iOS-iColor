//
//  GenerateVC.h
//  iColor
//
//  Created by YuhanHao on 15/11/13.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorItem.h"
#import "ColorCell.h"

@interface GenerateVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) UIButton *magicButton;

@property (strong, nonatomic) UITableView *generateColorTableView;
@property (strong, nonatomic) NSIndexPath *selectedIndex;

-(void)updateColor: (NSInteger) indexRow newColor: (ColorItem*)newColor;

@end

