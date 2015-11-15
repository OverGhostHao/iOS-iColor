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
    
    //const CGFloat* colors = CGColorGetComponents( color2.CGColor );
    // Do any additional setup after loading the view from its nib.
    UILabel *generate = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    [generate setText:@"Generating"];
    [self.view addSubview:generate];
    
    UILabel *generate1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 100, 50)];
    [generate1 setText:@"Generating"];
    [self.view addSubview:generate1];
    
    //Set the list page for navigation
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
    
    ColorItem *testColor = [[ColorItem alloc]init];
    [testColor setRGB:52 gValue:152 bValue:255];
    [generate setBackgroundColor:testColor.myUIColor];
    


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
