//
//  SimpleColorNoSidebarViewController.h
//  iColor
//
//  Created by Bojian Li on 11/28/15.
//  Copyright © 2015 Skejul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleColorNoSidebarViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *simpleColors;
@property (nonatomic, strong) NSArray *simpleColorsHex;
@property (nonatomic, strong) UITableView *tableView;
@end
