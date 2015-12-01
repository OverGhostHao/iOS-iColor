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
    
    UIView *bgView = [[UIView alloc]initWithFrame:self.bounds];
    self.backgroundView = bgView;
    ColorItem *c = [[ColorItem alloc]init];
    [c setRGB:255 gValue:100 bValue:20];
    self.backgroundView.backgroundColor = c.myUIColor;
    
    self.layer.cornerRadius = 25;
    self.clipsToBounds = YES;
    
    //UIView *bgView = [[UIView alloc]initWithFrame:self.bounds];
    
    self.backgroundView = bgView;
    
    
}

-(void) setCellImage: (UIImage*)cellImage {
    UIImageView *imageView = [[UIImageView alloc]initWithImage:cellImage];
    self.backgroundView = imageView;
    self.backgroundColor = [UIColor whiteColor
                            ];
}


@end
