//
//  SidebarTVC.m
//  iColor
//
//  Created by Labuser on 11/14/15.
//  Copyright (c) 2015 Skejul. All rights reserved.
//

#import "SidebarTVC.h"
#import "SWRevealViewController.h"
#import "GenerateVC.h"

@interface SidebarTVC ()

@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation SidebarTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _menuItems = @[@"Generate", @"Draw", @"Mix", @"My Color", @"My Image"];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [_menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor darkGrayColor];
    return cell;
}



@end
