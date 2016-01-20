//
//  detailView2.m
//  iColor
//
//  Created by YuhanHao on 16/1/20.
//  Copyright (c) 2016年 Skejul. All rights reserved.
//

#import "detailView2.h"

@implementation detailView2

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize backButton;
@synthesize redLabel;
@synthesize greenLabel;
@synthesize blueLabel;
@synthesize redValue;
@synthesize greenValue;
@synthesize blueValue;
@synthesize alphaLabel;
@synthesize alphaValue;
@synthesize deleteButton;
@synthesize currentColor;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    [self setUpBackButton];
    [self setUpDeleteButton];
    [self setUpLabels];
    
    return self;
}

- (void) setUpBackButton {
    
    NSLog(@"frame width: %f, height: %f, ", self.frame.size.width, self.frame.size.height);
    
    CGFloat buttonWidth = self.frame.size.width / 5.5;
    CGFloat buttonHeight = self.frame.size.height * 0.0682;
    CGFloat buttonStartX = buttonWidth * 1.4;
    CGFloat buttonStartY = self.frame.size.height * 0.85;
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(buttonStartX, buttonStartY, buttonWidth, buttonHeight)];
    [backButton addTarget:self action:@selector(backSegue) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
    backButton.layer.cornerRadius = 8.0;
    backButton.layer.masksToBounds = YES;
    [self addSubview:backButton];
}

- (void) setUpDeleteButton {
    CGFloat buttonWidth = self.frame.size.width / 5.5;
    CGFloat buttonHeight = self.frame.size.height * 0.0682;
    CGFloat buttonStartX = self.frame.size.width - buttonWidth * 2.4;
    CGFloat buttonStartY = self.frame.size.height * 0.85;
    deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(buttonStartX, buttonStartY, buttonWidth, buttonHeight)];
    [deleteButton addTarget:self action:@selector(deleteSegue) forControlEvents:UIControlEventTouchUpInside];
    [deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    [deleteButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
    deleteButton.tintColor = [UIColor whiteColor];
    deleteButton.layer.cornerRadius = 8.0;
    deleteButton.layer.masksToBounds = YES;
    [self addSubview:deleteButton];
    
}



- (void) backSegue {
    [self removeFromSuperview];
}

- (void) deleteSegue {
    //delete the current color from NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"savedMyColors"];
    NSMutableArray *preColors = [[NSMutableArray alloc] init];
    preColors = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    //[preColors addObject:mycolor];
    //if (preColors.lastObject == currentColor) NSLog(@"here");
    NSMutableArray *deleteItems = [[NSMutableArray alloc]init];
    for (ColorItem *cur in preColors) {
        if ([cur.hexString isEqualToString:currentColor.hexString]) {
            [deleteItems addObject:cur];
        }
    }
    [preColors removeObjectsInArray:deleteItems];
    
    //[preColors removeObject:currentColor];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"savedMyColors"];
    NSData *newData = [NSKeyedArchiver archivedDataWithRootObject:preColors];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:newData forKey:@"savedMyColors"];
    [def synchronize];

    [self.superview reloadInputViews];
    [self removeFromSuperview];
}


- (void) setUpLabels {
    CGFloat labelStartX = self.frame.size.width*0.11;
    CGFloat redlabelStartY = self.frame.size.height*0.0568;
    CGFloat labelWidth = self.frame.size.width * 0.78;
    CGFloat labelHeight = self.frame.size.height * 0.142;
    redLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelStartX, redlabelStartY, labelWidth, labelHeight)];
    redLabel.layer.cornerRadius = 7.0;
    redLabel.layer.masksToBounds = YES;
    [self addSubview:redLabel];
    
    CGFloat greenLabelStartY = redlabelStartY + labelHeight + self.frame.size.height * 0.06;
    greenLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelStartX, greenLabelStartY, labelWidth, labelHeight)];
    greenLabel.layer.cornerRadius = 7.0;
    greenLabel.layer.masksToBounds = YES;
    [self addSubview:greenLabel];
    
    CGFloat blueLabelStartY = greenLabelStartY + labelHeight + self.frame.size.height * 0.06;
    blueLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelStartX, blueLabelStartY, labelWidth, labelHeight)];
    blueLabel.layer.cornerRadius = 7.0;
    blueLabel.layer.masksToBounds = YES;
    [self addSubview:blueLabel];
    
    CGFloat alphaLabelStartY = blueLabelStartY + labelHeight + self.frame.size.height * 0.06;
    alphaLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelStartX, alphaLabelStartY, labelWidth, labelHeight)];
    alphaLabel.layer.cornerRadius = 7.0;
    alphaLabel.layer.masksToBounds = YES;
    [self addSubview:alphaLabel];
}


- (void) setContent:(ColorItem *)thisColor {
    self.backgroundColor = thisColor.myUIColor;
    
    //back button setting.
    ColorItem *buttonColor = [[ColorItem alloc]init];
    [buttonColor setRGB:thisColor.rValue/2 gValue:thisColor.gValue/2 bValue:thisColor.bValue/2];
    backButton.backgroundColor = buttonColor.myUIColor;
    deleteButton.backgroundColor = buttonColor.myUIColor;
    
    //labels setting.
    [redLabel setText:[NSString stringWithFormat:  @"     Red:              %li", (long)thisColor.rValue]];
    [redLabel setBackgroundColor:[UIColor colorWithRed:231/255.0 green:76/255.0 blue:60/255.0 alpha:1]];
    [greenLabel setText:[NSString stringWithFormat:@"     Green:          %li", (long)thisColor.gValue]];
    [greenLabel setBackgroundColor:[UIColor colorWithRed:46/255.0 green:204/255.0 blue:113/255.0 alpha:1]];
    [blueLabel setText:[NSString stringWithFormat: @"     Blue:             %li", (long)thisColor.bValue]];
    [blueLabel setBackgroundColor:[UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1]];
    [alphaLabel setText:[NSString stringWithFormat:@"     Alpha:          %f", thisColor.brightness]];
    [alphaLabel setBackgroundColor:[UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1]];
    
    currentColor = thisColor;
    
    
    
}

@end
