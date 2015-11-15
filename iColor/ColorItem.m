//
//  ColorItem.m
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "ColorItem.h"

@implementation ColorItem

//@synthesize isSavedColor;
//@synthesize hexString;

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.hexString = @" ";
//     //   self.isSavedColor = false;
//        self.brightness = 1.0;
//        self.rValue = 0.0;
//        self.gValue = 0.0;
//        self.bValue = 0.0;
//    }
//    return self;
//}


//
//-(void) setSaved:(BOOL) save {
//    self.isSavedColor = save;
//}


//-(ColorItem *) initWithRGB:(NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue {
//    self = [self initWithRed:newRValue green:newGValue blue:newBValue alpha:1.0];
//    //self = [self initWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>]
//    //self.isSavedColor = NO;
//    self.brightness = 1.0;
//    self.rValue = newRValue;
//    self.gValue = newGValue;
//    self.bValue = newBValue;
//    self.hexString = [NSString stringWithFormat:@"#%02X%02X%02X",(unsigned int)newRValue,(unsigned int)newGValue,(unsigned int)newBValue];
//    return self;
//}

-(void) setRGB:(NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue{

    //ColorItem *newColor = [[ColorItem alloc]initWithRed:newRValue green:newGValue blue:newBValue alpha:1.0];
    self.rValue = newRValue;
    self.gValue = newGValue;
    self.bValue = newBValue;
    self.hexString = [NSString stringWithFormat:@"#%02X%02X%02X",(unsigned int)newRValue,(unsigned int)newGValue,(unsigned int)newBValue];
    //self = newColor;
    
}


@end
