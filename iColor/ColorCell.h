//
//  ColorCell.h
//  iColor
//
//  Created by weiqi on 11/28/15.
//  Copyright (c) 2015 Skejul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorCell : UITableViewCell

@property NSInteger rValue;
@property NSInteger gValue;
@property NSInteger bValue;

@property UIButton *saveButton;
@property UIButton *okButton;

@property UISlider *redSlider;
@property UISlider *greenSlider;
@property UISlider *blueSlider;

-(void)clickSaveButton;
-(void)clickOkButton;
//-(void)createButtonSlider;
-(void)collapseCell;
-(void)expandCell;
@end
