//
//  detailMixView.m
//  iColor
//
//  Created by Xinyu Yan on 11/30/15.
//  Copyright © 2015 Skejul. All rights reserved.
//

#import "detailMixView.h"

@implementation detailMixView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    [self setUpBackButton];
    [self setUpSaveButton];
    [self setUpLabels];

    return self;
}

- (void) setUpBackButton {
    CGFloat buttonWidth = 50.0;
    CGFloat buttonHeight = 35.0;
    CGFloat buttonStartX = self.frame.size.width / 3*2 - buttonWidth / 2;
    CGFloat buttonStartY = self.frame.size.height - buttonHeight - 20;
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(buttonStartX, buttonStartY, buttonWidth, buttonHeight)];
    [backButton addTarget:self action:@selector(backSegue) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:@"OK" forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    backButton.layer.cornerRadius = 8.0;
    backButton.layer.masksToBounds = YES;
    [self addSubview:backButton];
}

-(void) setUpSaveButton{
    CGFloat buttonWidth = 50.0;
    CGFloat buttonHeight = 35.0;
    CGFloat buttonStartX = self.frame.size.width / 3 - buttonWidth / 2;
    CGFloat buttonStartY = self.frame.size.height - buttonHeight - 20;
    saveButton = [[UIButton alloc]initWithFrame:CGRectMake(buttonStartX, buttonStartY, buttonWidth, buttonHeight)];
    [saveButton addTarget:self action:@selector(saveSegue) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    saveButton.tintColor = [UIColor whiteColor];
    saveButton.layer.cornerRadius = 8.0;
    saveButton.layer.masksToBounds = YES;
    [self addSubview:saveButton];
}

- (void) backSegue {
    [self removeFromSuperview];
}

- (void) saveSegue {
    GlobalVars *globals = [GlobalVars sharedInstance];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.hexString contains[c] %@", mycolor.hexString];
    NSArray *results = [globals.savedColors filteredArrayUsingPredicate:predicate];
    if (results.count == 0) {
        [globals.savedColors addObject:mycolor];
    }
    [self removeFromSuperview];
}

- (void) setUpLabels {
    redLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 20, self.frame.size.width - 60, 50)];
    redLabel.layer.cornerRadius = 7.0;
    redLabel.layer.masksToBounds = YES;
    [self addSubview:redLabel];
    greenLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 90, self.frame.size.width - 60, 50)];
    greenLabel.layer.cornerRadius = 7.0;
    greenLabel.layer.masksToBounds = YES;
    [self addSubview:greenLabel];
    blueLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 160, self.frame.size.width - 60, 50)];
    blueLabel.layer.cornerRadius = 7.0;
    blueLabel.layer.masksToBounds = YES;
    [self addSubview:blueLabel];
    alphaLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 230, self.frame.size.width - 60, 50)];
    alphaLabel.layer.cornerRadius = 7.0;
    alphaLabel.layer.masksToBounds = YES;
    [self addSubview:alphaLabel];
}


- (void) setContent:(ColorItem *)thisColor {
    self.backgroundColor = thisColor.myUIColor;
    mycolor = thisColor;
    
    //back button setting.
    ColorItem *buttonColor = [[ColorItem alloc]init];
    [buttonColor setRGB:thisColor.rValue/2 gValue:thisColor.gValue/2 bValue:thisColor.bValue/2];
    backButton.backgroundColor = buttonColor.myUIColor;
    
    //save button setting.
    ColorItem *buttonColor1 = [[ColorItem alloc]init];
    [buttonColor1 setRGB:thisColor.rValue/2 gValue:thisColor.gValue/2 bValue:thisColor.bValue/2];
    saveButton.backgroundColor = buttonColor.myUIColor;
    
    //labels setting.
    [redLabel setText:[NSString stringWithFormat:  @"     Red:              %li", (long)thisColor.rValue]];
    [redLabel setBackgroundColor:[UIColor colorWithRed:231/255.0 green:76/255.0 blue:60/255.0 alpha:1]];
    [greenLabel setText:[NSString stringWithFormat:@"     Green:          %li", (long)thisColor.gValue]];
    [greenLabel setBackgroundColor:[UIColor colorWithRed:46/255.0 green:204/255.0 blue:113/255.0 alpha:1]];
    [blueLabel setText:[NSString stringWithFormat: @"     Blue:             %li", (long)thisColor.bValue]];
    [blueLabel setBackgroundColor:[UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1]];
    [alphaLabel setText:[NSString stringWithFormat:@"     Alpha:          %f", thisColor.brightness]];
    [alphaLabel setBackgroundColor:[UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1]];
    
}




@end
