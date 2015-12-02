//
//  detailMixView.h
//  iColor
//
//  Created by Xinyu Yan on 11/30/15.
//  Copyright © 2015 Skejul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "ColorItem.h"
#import "GlobalVars.h"

@interface detailMixView : UIView{
    UIButton *backButton;
    UIButton *saveButton;
    UILabel *redLabel;
    UILabel *greenLabel;
    UILabel *blueLabel;
    UILabel *redValue;
    UILabel *greenValue;
    UILabel *blueValue;
    UILabel *alphaLabel;
    UILabel *alphaValue;
    ColorItem *mycolor;
    
}

- (void) setContent:(ColorItem *)thisColor;

@end
