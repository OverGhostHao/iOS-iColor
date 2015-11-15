//
//  MyImagesVC.m
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "MyImagesVC.h"

@interface MyImagesVC ()

@end

@implementation MyImagesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *myImageItems = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 200)];
    [myImageItems setText:@"myImageItems"];
    [self.view addSubview:myImageItems];
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
