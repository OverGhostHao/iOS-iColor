//
//  SimpleColors.h
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface SimpleColors: UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (nonatomic, strong) NSArray *simpleColors;
@property (nonatomic, strong) NSArray *simpleColorsHex;
@property (nonatomic, strong) UITableView *tableView;

@end
