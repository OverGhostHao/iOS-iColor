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

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeInteger: self.rValue forKey:@"rValue"];
    [encoder encodeInteger: self.gValue forKey:@"gValue"];
    [encoder encodeInteger: self.bValue forKey:@"bValue"];
    [encoder encodeObject: self.myUIColor forKey:@"myUIColor"];
    [encoder encodeObject: self.hexString forKey:@"hexString"];
    [encoder encodeFloat: self.brightness forKey:@"brightness"];
    [encoder encodeBool: self.saved forKey:@"saved"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.rValue = [decoder decodeIntegerForKey:@"rValue"];
        self.gValue = [decoder decodeIntegerForKey:@"gValue"];
        self.bValue = [decoder decodeIntegerForKey:@"bValue"];
        self.myUIColor = [decoder decodeObjectForKey:@"myUIColor"];
        self.hexString = [decoder decodeObjectForKey:@"hexString"];
        self.brightness = [decoder decodeFloatForKey:@"brightness"];
        self.saved = [decoder decodeBoolForKey:@"saved"];
    }
    return self;
}


-(void) setRGB:(NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue{

    UIColor *newColor = [[UIColor alloc]initWithRed:(CGFloat)newRValue/255 green:(CGFloat)newGValue/255 blue:(CGFloat)newBValue/255 alpha:1.0];
    
    self.myUIColor = newColor;
    self.rValue = newRValue;
    self.gValue = newGValue;
    self.bValue = newBValue;
    self.hexString = [NSString stringWithFormat:@"#%02X%02X%02X",(unsigned int)newRValue,(unsigned int)newGValue,(unsigned int)newBValue];
    //self = newColor;
    
}


@end
