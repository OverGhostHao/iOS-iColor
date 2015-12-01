//
//  SimpleSavedColorVC.h
//  iColor
//
//  Created by Bojian Li on 11/30/15.
//  Copyright © 2015 Skejul. All rights reserved.
//
#import "SWRevealViewController.h"
#import <UIKit/UIKit.h>
#import "DrawVC.h"
#import "GlobalVars.h"

@interface SimpleSavedColorVC : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (nonatomic, strong) NSArray *simpleColors;
@property (nonatomic, strong) NSMutableArray *simpleColorsHex;
@property (nonatomic, strong) UITableView *tableView;
@property UIViewController *draw;

@end
