//
//  MyImagesViewCell.m
//  iColor
//
//  Created by YuhanHao on 15/11/29.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "MyImagesViewCell.h"

@implementation MyImagesViewCell

- (void)awakeFromNib {
    
    
    //UIView *bgView = [[UIView alloc]initWithFrame:self.bounds];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    [imageView setBackgroundColor:[UIColor darkGrayColor]];
    self.backgroundView = imageView;
    
    
}

@end
