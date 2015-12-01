//
//  CollectionViewCell.m
//  CollectionViewTest
//
//  Created by YuhanHao on 15/11/28.
//  Copyright (c) 2015年 YuhanHao. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    
    
    UIView *bgView = [[UIView alloc]initWithFrame:self.bounds];
    self.backgroundView = bgView;
    ColorItem *c = [[ColorItem alloc]init];
    [c setRGB:255 gValue:100 bValue:20];
    self.backgroundView.backgroundColor = c.myUIColor;
    
    self.layer.cornerRadius = 25;
    self.clipsToBounds = YES;
    
    [self.textLabel setFont:[UIFont fontWithName:@"American Typewriter" size:20]];
    
    
}

-(void) setCellColor: (ColorItem*)color {
    ColorItem *temp = [[ColorItem alloc]init];
    [temp setRGB:color.rValue gValue:color.gValue bValue:color.bValue];
    self.backgroundView.backgroundColor = temp.myUIColor;
}

@end
