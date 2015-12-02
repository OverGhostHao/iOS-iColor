//
//  ColorItem.h
//  iColor
//
//  Created by YuhanHao on 15/11/14.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorItem : NSObject

@property UIColor* myUIColor;

@property NSInteger rValue;
@property NSInteger gValue;
@property NSInteger bValue;
@property NSString* hexString;
@property float brightness;

-(void) setRGB: (NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue;

-(void) updateUIColor: (NSInteger)newRValue gValue:(NSInteger)newGValue bValue:(NSInteger)newBValue;
@end
