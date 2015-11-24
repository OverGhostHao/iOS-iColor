//
//  MixVC.h
//  iColor
//
//  Created by YuhanHao on 15/11/13.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MixVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSMutableArray *color;
@property (nonatomic, strong) UITableView *tableView;

@end
