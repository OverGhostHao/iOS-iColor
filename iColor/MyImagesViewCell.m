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
    //    ColorItem *c = [[ColorItem alloc]init];
    //    [c setRGB:255 gValue:100 bValue:20];
    //    self.backgroundView.backgroundColor = c.myUIColor;
    //
    //    UIView *selectedView = [[UIView alloc]initWithFrame:self.bounds];
    //    self.selectedBackgroundView = selectedView;
    //    ColorItem *s = [[ColorItem alloc]init];
    //    [s setRGB:255 gValue:255 bValue:255];
    //    self.selectedBackgroundView.backgroundColor = s.myUIColor;
    //
    //    [self.textLabel setFont:[UIFont fontWithName:@"American Typewriter" size:20]];
    //    
}

@end
