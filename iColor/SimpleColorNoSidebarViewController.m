//
//  SimpleColorNoSidebarViewController.m
//  iColor
//
//  Created by Bojian Li on 11/28/15.
//  Copyright © 2015 Skejul. All rights reserved.
//

#import "SimpleColorNoSidebarViewController.h"

@interface SimpleColorNoSidebarViewController ()

@end

@implementation SimpleColorNoSidebarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.simpleColors = [[NSArray alloc]initWithObjects: [UIColor blackColor], [UIColor darkGrayColor], [UIColor lightGrayColor], [UIColor whiteColor], [UIColor grayColor], [UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor cyanColor], [UIColor yellowColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor purpleColor], [UIColor brownColor], nil];
    
    self.simpleColorsHex = [[NSArray alloc]initWithObjects:@"#000000", @"#555555", @"#AAAAAA", @"#FFFFFF", @"#808080",@"#FF0000",@"#00FF00",@"#0000FF",@"#00FFFF",@"#FFFF00",@"#FF00FF",@"#FF8000",@"#800080", @"#996633", nil];
    
    //ADDING TABLEVIEW
    self.tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStylePlain];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    NSLog(@"%@",cellText);
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
    cell.backgroundColor = self.simpleColors[indexPath.row];
    cell.textLabel.text = self.simpleColorsHex[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height/7;
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
