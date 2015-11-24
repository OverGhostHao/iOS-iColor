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

NSMutableArray *currentColors;

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

    CGFloat x = self.view.frame.origin.x;
    CGFloat y = self.view.frame.origin.y + self.navigationController.navigationBar.layer.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height/6 * 5;
    self.generateColorTableView = [[UITableView alloc]initWithFrame:CGRectMake(x,y,width,height) style:UITableViewStyleGrouped];
    [self.generateColorTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.generateColorTableView.dataSource = self;
    self.generateColorTableView.delegate = self;
    [self.generateColorTableView setScrollEnabled:false];
    //hack way to delete the white space under the navigation bar.
    self.generateColorTableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    [self.view addSubview: self.generateColorTableView];

    CGFloat buttonY = self.generateColorTableView.frame.origin.y + height;
    CGFloat buttonHeight = self.view.frame.size.height - buttonY;
    self.magicButton = [[UIButton alloc]initWithFrame:CGRectMake(x, buttonY, width, buttonHeight)];
    self.magicButton.backgroundColor = [UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1];
    [self.magicButton setTitle:@"MAGIC" forState:UIControlStateNormal];
    [self.magicButton addTarget:self action:@selector(magicButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.magicButton];
    
    //init random colors;
    currentColors = [[NSMutableArray alloc]init];
    for (int i = 0; i < 5; i++) {
        ColorItem *newC = [[ColorItem alloc]init];
        newC = [self generateRandomColor];
        [currentColors addObject:newC];
    }

    //NSLog(@"%@", currentColors);
    

}


- (void)magicButtonTapped:(id)sender {
    for (int i = 0; i < 5; i++) {
        ColorItem *newC = [[ColorItem alloc]init];
        newC = [self generateRandomColor];
        currentColors[i] = newC;
    }
    [self.generateColorTableView reloadData];
    
}


-(ColorItem *) generateRandomColor {
    NSInteger red = arc4random_uniform(256);
    NSInteger green = arc4random_uniform(256);
    NSInteger blue = arc4random_uniform(256);
    ColorItem *newColor = [[ColorItem alloc]init];
    [newColor setRGB:red gValue:green bValue:blue];
    return newColor;
    
}

//hi

/*
#pragma mark - Navigation


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    ColorItem *color = [self generateRandomColor];
    cell.backgroundColor = color.myUIColor;
    cell.textLabel.text = color.hexString;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height/6;
}


@end
