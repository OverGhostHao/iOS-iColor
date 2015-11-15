//
//  GenerateVC.m
//  iColor
//
//  Created by YuhanHao on 15/11/13.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "GenerateVC.h"

@interface GenerateVC ()

@end

@implementation GenerateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *generate = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 100, 200)];
    [generate setText:@"Generating"];
    [self.view addSubview:generate];
    //git test
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//hi

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
