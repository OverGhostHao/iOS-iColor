//
//  MixVC.m
//  iColor
//
//  Created by YuhanHao on 15/11/13.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "MixVC.h"
#import "SWRevealViewController.h"
#import "ColorItem.h"
#import <QuartzCore/QuartzCore.h>

@interface MixVC ()

@end

@implementation MixVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UILabel *mixLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 200)];
//    [mixLabel setText:@"Mixing"];
//    [self.view addSubview:mixLabel];
    
    
    //self.color = [NSMutableArray arrayWithObjects:[UIColor redColor],[UIColor greenColor],[UIColor yellowColor],[UIColor blueColor],[UIColor purpleColor], nil];
    
    //Set the list page for navigation
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.title = @"Mix Color";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName, nil]];
    
    numLine = 5;
    
//    CGFloat x = self.view.frame.origin.x;
//    CGFloat y = self.view.frame.origin.y+self.navigationController.navigationBar.layer.frame.size.height+100;
//    CGFloat width = self.view.frame.size.width;
//    CGFloat height = (self.view.frame.size.height-100)/5;
    
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.tableView];
    [self.tableView setBackgroundColor:[UIColor grayColor]];
    [self.tableView setScrollEnabled:NO];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.layer.cornerRadius = 15;
    button1.clipsToBounds = YES;
    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"COLOR1" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    button1.frame = CGRectMake(10, -13, 100, 40);
    button1.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:18];
    button1.backgroundColor = [UIColor darkGrayColor];
    [self.tableView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.layer.cornerRadius = 15;
    button2.clipsToBounds = YES;
    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"COLOR2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    button2.frame = CGRectMake(120, -13, 100, 40);
    button2.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:18];
    button2.backgroundColor = [UIColor darkGrayColor];
    [self.tableView addSubview:button2];
    
    //Create the slider
    NSArray *itemArray = [NSArray arrayWithObjects:@"5",@"6",@"7",@"8",@"9",@"10", nil];
    UISegmentedControl *levelSegment = [[UISegmentedControl alloc] initWithItems:itemArray];
    levelSegment.frame = CGRectMake(230, -13, 180, 40);
    [levelSegment addTarget:self action:@selector(changeLevel:) forControlEvents:UIControlEventValueChanged];
    [levelSegment setTintColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0]];
    levelSegment.selectedSegmentIndex = 0;
    [levelSegment setBackgroundColor:[UIColor clearColor]];
    [self.tableView addSubview:levelSegment];
    
    //init random colors;
    self.color = [[NSMutableArray alloc]init];
    for (int i = 0; i < 5; i++) {
        ColorItem *newC = [[ColorItem alloc]init];
        newC = [self generateRandomColor];
        [self.color addObject:newC];
    }
    
}

-(ColorItem *) generateRandomColor {
    NSInteger red = arc4random_uniform(256);
    NSInteger green = arc4random_uniform(256);
    NSInteger blue = arc4random_uniform(256);
    ColorItem *newColor = [[ColorItem alloc]init];
    [newColor setRGB:red gValue:green bValue:blue];
    return newColor;
    
}

-(void)changeLevel: (UISegmentedControl *)sender{
    numLine = 5+sender.selectedSegmentIndex;
    for (int i=5; i<numLine; i++) {
        ColorItem *newC = [[ColorItem alloc] init];
        newC = [self generateRandomColor];
        [self.color addObject:newC];
    }
    [self.tableView reloadData];
    
}

-(void)button1Action: (id)sender{
//    ColorItem *testColor = [[ColorItem alloc]init];
//    [testColor setRGB:102 gValue:0 bValue:204];
//    
//    [self.color replaceObjectAtIndex:0 withObject:testColor];
//    [self.tableView reloadData];
    
    ColorItem *testColor = [[ColorItem alloc]init];
    testColor = [self generateRandomColor];
    [self.color replaceObjectAtIndex:0 withObject:testColor];
    [self.tableView reloadData];
}

-(void)button2Action: (id)sender{
    
    ColorItem *testColorLast = [[ColorItem alloc]init];
    testColorLast = [self generateRandomColor];
    [self.color replaceObjectAtIndex:(numLine-1) withObject:testColorLast];

    
    
    for (int i=1; i<=(numLine-2); i++) {
        ColorItem *colorNow = [[ColorItem alloc] init];
        colorNow = [self mixColor:i andLastColor:testColorLast];
        [self.color replaceObjectAtIndex:i withObject:colorNow];
    }
    
    [self.tableView reloadData];
    
}


-(ColorItem *)mixColor:(int) index andLastColor:(ColorItem *)lastColor{
    ColorItem *firstColor = [self.color objectAtIndex:0];
    ColorItem *colorMix = [[ColorItem alloc] init];
    
    NSInteger rlow = MIN(firstColor.rValue, lastColor.rValue);
    NSInteger rhigh = MAX(firstColor.rValue, lastColor.rValue);
    NSInteger rmix;
    if (firstColor.rValue == rlow) {
       rmix = rlow + (float)(index-1)/(numLine) * (rhigh-rlow);
    }else{
        rmix = rlow - (float)(index-1)/(numLine) * (rhigh-rlow);
    }
    
    NSInteger glow = MIN(firstColor.gValue, lastColor.gValue);
    NSInteger ghigh = MAX(firstColor.gValue, lastColor.gValue);
    NSInteger gmix;
    if (firstColor.gValue == glow) {
        gmix = glow + (float)(index-1)/(numLine) * (ghigh-glow);
    }else{
        gmix = glow - (float)(index-1)/(numLine) * (ghigh-glow);
    }
    
    NSInteger blow = MIN(firstColor.bValue, lastColor.bValue);
    NSInteger bhigh = MAX(firstColor.bValue, lastColor.bValue);
    NSInteger bmix;
    if (firstColor.bValue == blow) {
        bmix = blow + (float)(index-1)/(numLine) * (bhigh-blow);
    }else{
        bmix = blow - (float)(index-1)/(numLine) * (bhigh-blow);
    }
    
    
    [colorMix setRGB:rmix gValue:gmix bValue:bmix];
    return colorMix;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.color ?1:0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.color?self.color.count :0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
    }
    
    ColorItem *thisColor;
    thisColor = [self.color objectAtIndex:indexPath.row];
    cell.backgroundColor = thisColor.myUIColor;
    cell.textLabel.text = thisColor.hexString;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return self.view.frame.size.height/(numLine+1);
    return (self.tableView.frame.size.height-98)/numLine;
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
