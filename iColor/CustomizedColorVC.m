//
//  CustomizedColorVC.m
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "CustomizedColorVC.h"

@interface CustomizedColorVC ()

@end

@implementation CustomizedColorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *customizedColors = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 200)];
    [customizedColors setText:@"customizedColors"];
    [self.view addSubview:customizedColors];

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
