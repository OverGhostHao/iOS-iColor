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

@interface MixVC ()

@end

@implementation MixVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UILabel *mixLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 200)];
//    [mixLabel setText:@"Mixing"];
//    [self.view addSubview:mixLabel];
    
    self.data = [NSArray arrayWithObjects:@"color1",@"color2",@"color3",@"color4",@"color5", nil];
    
//    ColorItem *item1 = [[ColorItem alloc] init];
//    [item1 setRGB:255 gValue:134 bValue:156];
//    ColorItem *item2 = [[ColorItem alloc] init];
//    [item1 setRGB:246 gValue:137 bValue:200];
//    ColorItem *item3 = [[ColorItem alloc] init];
//    [item1 setRGB:100 gValue:134 bValue:200];
//    ColorItem *item4 = [[ColorItem alloc] init];
//    [item1 setRGB:245 gValue:218 bValue:156];
//    ColorItem *item5 = [[ColorItem alloc] init];
//    [item1 setRGB:100 gValue:134 bValue:244];
//    
//    self.color = [NSMutableArray arrayWithObjects:item1,item2,item3,item4,item5, nil];
    
    self.color = [NSMutableArray arrayWithObjects:[UIColor redColor],[UIColor greenColor],[UIColor yellowColor],[UIColor blueColor],[UIColor purpleColor], nil];
    
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
    
    
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.tableView];
    [self.tableView setBackgroundColor:[UIColor grayColor]];
    [self.tableView setScrollEnabled:NO];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"COLOR1" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    button1.frame = CGRectMake(10, -15, 100, 40);
    button1.backgroundColor = [UIColor purpleColor];
    [self.tableView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"COLOR2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    button2.frame = CGRectMake(120, -15, 100, 40);
    button2.backgroundColor = [UIColor purpleColor];
    [self.tableView addSubview:button2];
    
}

-(void)button1Action: (id)sender{
    ColorItem *testColor = [[ColorItem alloc]init];
    [testColor setRGB:102 gValue:0 bValue:204];
    
    [self.color replaceObjectAtIndex:0 withObject:testColor.myUIColor];
    [self.tableView reloadData];
}

-(void)button2Action: (id)sender{
    ColorItem *testColor5 = [[ColorItem alloc]init];
    [testColor5 setRGB:204 gValue:153 bValue:255];
    
//    ColorItem *testColor1 = [self.color objectAtIndex:0];
    
    
//    ColorItem *testColor2 = [[ColorItem alloc] init];
    

//    [testColor2 setRGB:(MIN(testColor1.rValue,testColor5.rValue)+ABS(testColor1.rValue-testColor5.rValue))*2/5 gValue:100 bValue:200];
//    CGFloat r2 = (MIN(testColor1.rValue,testColor5.rValue)+ABS(testColor1.rValue-testColor5.rValue))*2/5;
//    CGFloat g2 = (MIN(testColor1.gValue,testColor5.gValue)+ABS(testColor1.gValue-testColor5.gValue))*2/5;
//    CGFloat b2 = (MIN(testColor1.bValue,testColor5.bValue)+ABS(testColor1.bValue-testColor5.bValue))*2/5;

//    [testColor2 setRGB:122 gValue:133 bValue:144];
    
    ColorItem *testColor1 = [[ColorItem alloc]init];
    [testColor1 setRGB:127 gValue:0 bValue:255];
    
    ColorItem *testColor2 = [[ColorItem alloc]init];
    [testColor2 setRGB:153 gValue:51 bValue:255];
    
    ColorItem *testColor3 = [[ColorItem alloc]init];
    [testColor3 setRGB:178 gValue:102 bValue:255];

    
    [self.color replaceObjectAtIndex:1 withObject:testColor1.myUIColor];
    [self.color replaceObjectAtIndex:2 withObject:testColor2.myUIColor];
    [self.color replaceObjectAtIndex:3 withObject:testColor3.myUIColor];
    [self.color replaceObjectAtIndex:4 withObject:testColor5.myUIColor];
    [self.tableView reloadData];
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data ?1:0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data?self.data.count :0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
    }

    NSString *myString;
    myString = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = myString;
    
    UIColor *thisColor;
    thisColor = [self.color objectAtIndex:indexPath.row];
    cell.backgroundColor = thisColor;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
