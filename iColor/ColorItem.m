//
//  ColorItem.m
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "ColorItem.h"

@implementation ColorItem

@synthesize saved;
@synthesize rValue;
@synthesize gValue;
@synthesize bValue;



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.rValue = 0;
        self.gValue = 0;
        self.bValue = 0;
        self.myUIColor = [[UIColor alloc]init];
        self.hexString = @" ";
        self.brightness = 1.0;
        self.saved = false;
        
    }
    return self;
}


-(void) setRGB:(NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue{

    UIColor *newColor = [[UIColor alloc]initWithRed:newRValue/255 green:newGValue/255 blue:newBValue/255 alpha:1.0];
    self.myUIColor = newColor;
    self.rValue = newRValue;
    self.gValue = newGValue;
    self.bValue = newBValue;
    self.hexString = [NSString stringWithFormat:@"#%02X%02X%02X",(unsigned int)newRValue,(unsigned int)newGValue,(unsigned int)newBValue];
    //self = newColor;
    
}


@end
