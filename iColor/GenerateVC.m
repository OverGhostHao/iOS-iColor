//
//  GenerateVC.m
//  iColor
//
//  Created by YuhanHao on 15/11/13.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "GenerateVC.h"
#import "SWRevealViewController.h"

#import "ColorItem.h"

@interface GenerateVC ()

@end

@implementation GenerateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //navigation bar setting.
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.title = @"Generate Color";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName, nil]];
    
//    ColorItem *testColor = [[ColorItem alloc]init];
//    [testColor setRGB:52 gValue:152 bValue:255];
//    [generate setBackgroundColor:testColor.myUIColor];
        


    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}






@end
