//
//  detailView2.h
//  iColor
//
//  Created by YuhanHao on 16/1/20.
//  Copyright (c) 2016年 Skejul. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "ColorItem.h"


@interface detailView2 : UIView

@property UIButton *backButton;
@property UIButton *deleteButton;

@property UILabel *redLabel;
@property UILabel *greenLabel;
@property UILabel *blueLabel;
@property UILabel *redValue;
@property UILabel *greenValue;
@property UILabel *blueValue;
@property UILabel *alphaLabel;
@property UILabel *alphaValue;

@property ColorItem *currentColor;


- (void) setContent:(ColorItem *)thisColor;

@end
