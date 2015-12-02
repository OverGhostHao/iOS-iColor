//  SimpleColors.m
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "SimpleColors.h"

@interface SimpleColors ()

@end

@implementation SimpleColors

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.title = @"Simple Colors";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName, nil]];
    
//    self.simpleColors = [[NSArray alloc]initWithObjects:
//                         [UIColor blackColor], [UIColor darkGrayColor], [UIColor lightGrayColor], [UIColor whiteColor], [UIColor grayColor], [UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor cyanColor], [UIColor yellowColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor purpleColor], [UIColor brownColor], nil];
//    
    self.simpleColors = [[NSMutableArray alloc]init];
    ColorItem *new1 = [[ColorItem alloc]init];
    [new1 setRGB:228 gValue:127 bValue:175];
    [self.simpleColors addObject:new1];
    ColorItem *new2 = [[ColorItem alloc]init];
    [new2 setRGB:238 gValue:79 bValue:71];
    [self.simpleColors addObject:new2];
    ColorItem *new3 = [[ColorItem alloc]init];
    [new3 setRGB:62 gValue:113 bValue:208];
    [self.simpleColors addObject:new3];
    ColorItem *new4 = [[ColorItem alloc]init];
    [new4 setRGB:61 gValue:172 bValue:228];
    [self.simpleColors addObject:new4];
    ColorItem *new5 = [[ColorItem alloc]init];
    [new5 setRGB:84 gValue:200 bValue:246];
    [self.simpleColors addObject:new5];
    ColorItem *new6 = [[ColorItem alloc]init];
    [new6 setRGB:82 gValue:105 bValue:107];
    [self.simpleColors addObject:new6];
    ColorItem *new7 = [[ColorItem alloc]init];
    [new7 setRGB:231 gValue:216 bValue:82];
    [self.simpleColors addObject:new7];
    ColorItem *new8 = [[ColorItem alloc]init];
    [new8 setRGB:188 gValue:255 bValue:155];
    [self.simpleColors addObject:new8];
    ColorItem *new9 = [[ColorItem alloc]init];
    [new9 setRGB:110 gValue:229 bValue:133];
    [self.simpleColors addObject:new9];
    ColorItem *new10 = [[ColorItem alloc]init];
    [new10 setRGB:114 gValue:74 bValue:223];
    [self.simpleColors addObject:new10];
    ColorItem *new11 = [[ColorItem alloc]init];
    [new11 setRGB:167 gValue:66 bValue:249];
    [self.simpleColors addObject:new11];
    ColorItem *new12 = [[ColorItem alloc]init];
    [new12 setRGB:215 gValue:34 bValue:57];
    [self.simpleColors addObject:new12];
    ColorItem *new13 = [[ColorItem alloc]init];
    [new13 setRGB:43 gValue:233 bValue:164];
    [self.simpleColors addObject:new13];
    ColorItem *new14 = [[ColorItem alloc]init];
    [new14 setRGB:28 gValue:221 bValue:247];
    [self.simpleColors addObject:new14];
    ColorItem *new15 = [[ColorItem alloc]init];
    [new15 setRGB:254 gValue:127 bValue:140];
    [self.simpleColors addObject:new15];
    ColorItem *new16 = [[ColorItem alloc]init];
    [new16 setRGB:51 gValue:140 bValue:211];
    [self.simpleColors addObject:new16];
    ColorItem *new17 = [[ColorItem alloc]init];
    [new17 setRGB:151 gValue:15 bValue:218];
    [self.simpleColors addObject:new17];
    ColorItem *new18 = [[ColorItem alloc]init];
    [new18 setRGB:247 gValue:118 bValue:192];
    [self.simpleColors addObject:new18];
    ColorItem *new19 = [[ColorItem alloc]init];
    [new19 setRGB:241 gValue:179 bValue:49];
    [self.simpleColors addObject:new19];
    ColorItem *new20 = [[ColorItem alloc]init];
    [new20 setRGB:243 gValue:143 bValue:252];
    [self.simpleColors addObject:new20];
    ColorItem *new21 = [[ColorItem alloc]init];
    [new21 setRGB:255 gValue:255 bValue:255];
    [self.simpleColors addObject:new21];
    ColorItem *new22 = [[ColorItem alloc]init];
    [new22 setRGB:0 gValue:0 bValue:0];
    [self.simpleColors addObject:new22];


    
//    self.simpleColorsHex = [[NSArray alloc]initWithObjects:
//                            @"#000000",
//                            @"#555555",
//                            @"#AAAAAA",
//                            @"#FFFFFF",
//                            @"#808080",
//                            @"#FF0000",
//                            @"#00FF00",
//                            @"#0000FF",
//                            @"#00FFFF",
//                            @"#FFFF00",
//                            @"#FF00FF",
//                            @"#FF8000",
//                            @"#800080",
//                            @"#996633", nil];
    
    //ADDING TABLEVIEW
    self.tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStylePlain];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    [self.tableView setBackgroundColor:[UIColor colorWithRed:107/255.0 green:185/255.0 blue:240/255.0 alpha:1]];

    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    ColorItem *tc = [[ColorItem alloc]init];
    tc = self.simpleColors[indexPath.row];
    cell.backgroundColor = tc.myUIColor;
    cell.textLabel.text = tc.hexString;
    ColorItem *textColor = [[ColorItem alloc]init];
    if (tc.rValue + tc.gValue + tc.bValue > 200) {
        [textColor setRGB:tc.rValue/2.0 gValue:tc.gValue/2.0 bValue:tc.bValue/2.0];
    }else {
        [textColor setRGB:255.0-tc.rValue gValue:255.0-tc.gValue bValue:255.0-tc.bValue];
    }
    cell.textLabel.textColor = textColor.myUIColor;
    [cell.textLabel setFont:[UIFont fontWithName:@"American Typewriter" size:20]];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height/7;
}


@end