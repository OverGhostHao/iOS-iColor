//  SimpleColors.m
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "SimpleSavedColorVC.h"

@interface SimpleSavedColorVC ()

@end

@implementation SimpleSavedColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Navigatio setting.
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.title = @"My Colors";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName, nil]];
    
    //Global variable setting.
    GlobalVars *globals = [GlobalVars sharedInstance];
    NSMutableArray *myColors = globals.savedColors;
    
    //Default colors setting.
    self.simpleColors = [[NSArray alloc]initWithArray:myColors];
    self.simpleColorsHex = [[NSMutableArray alloc] init];
    for (ColorItem *c in self.simpleColors) {
        CGFloat r = c.rValue;
        CGFloat g = c.gValue;
        CGFloat b = c.bValue;
        
        NSString *s = [NSString stringWithFormat:@"#%02lX%02lX%02lX",
                lroundf(r),
                lroundf(g),
                lroundf(b)];
        [self.simpleColorsHex addObject:s];
    }
    
    //ADDING TABLEVIEW
    self.tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:107/255.0 green:185/255.0 blue:240/255.0 alpha:1]];
    
    //to eliminate the space margin under navigaiton bar.
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    [self.view addSubview:self.tableView];
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    DrawVC *dvc = (DrawVC*)self.draw;
    [dvc changeColor:cellText];
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.simpleColors.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    ColorItem *tempColor = [[ColorItem alloc]init];
    tempColor = self.simpleColors[indexPath.row];
    cell.backgroundColor = tempColor.myUIColor;
    ColorItem *textColor = [[ColorItem alloc]init];
    if (tempColor.rValue + tempColor.gValue + tempColor.bValue > 200) {
        [textColor setRGB:tempColor.rValue/2.0 gValue:tempColor.gValue/2.0 bValue:tempColor.bValue/2.0];
    }else {
        [textColor setRGB:255.0-tempColor.rValue gValue:255.0-tempColor.gValue bValue:255.0-tempColor.bValue];
    }
    cell.textLabel.textColor = textColor.myUIColor;

    cell.textLabel.text = self.simpleColorsHex[indexPath.row];
    [cell.textLabel setFont:[UIFont fontWithName:@"American Typewriter" size:20]];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height/7;
}


@end