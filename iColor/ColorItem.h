//
//  ColorItem.h
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorItem : UIColor

@property NSInteger rValue;
@property NSInteger gValue;
@property NSInteger bValue;
@property NSString *hexString;
@property float brightness;


//@property BOOL isSavedColor;

//-(void) setSaved:(BOOL) save;

//-(void) setRGBValue:(NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue;

-(void) setRGB: (NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue;

//-(void) getHexString;

//-(ColorItem *) initWithRGB:(NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue;

@end
