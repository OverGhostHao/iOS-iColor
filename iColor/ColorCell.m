//
//  ColorCell.m
//  iColor
//
//  Created by weiqi on 11/28/15.
//  Copyright (c) 2015 Skejul. All rights reserved.
//

#import "ColorCell.h"

@implementation ColorCell

@synthesize rValue;
@synthesize gValue;
@synthesize bValue;

@synthesize saveButton;
@synthesize okButton;

@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.accessoryType = UITableViewCellAccessoryNone;
        [self createButtonSlider];
        [self collapseCell];
    }
    return self;
}

-(void) createButtonSlider{
    
    CGRect cellFrame = self.frame;
    CGFloat width = CGRectGetWidth(cellFrame);
    CGFloat height = CGRectGetHeight(cellFrame);
    //NSLog(@"@",cellFrame);
    
    self.contentView.frame = cellFrame;
    //save button
    saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame = CGRectMake(width*0.15, height*4.8, 40, 40);
    saveButton.backgroundColor = [UIColor whiteColor];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(clickSaveButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:saveButton];
    
    //ok button
    okButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    okButton.frame = CGRectMake(width*0.95, height*4.8, 40, 40);
    okButton.backgroundColor = [UIColor whiteColor];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(clickOkButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:okButton];
    
    //red slider
    redSlider = [[UISlider alloc]initWithFrame:CGRectMake(width*0.15, height*1.3, width*0.8, 5)];
    redSlider.minimumValue = 0;
    redSlider.maximumValue = 255;
    redSlider.value = 100;
    [redSlider addTarget:self action:@selector(moveRedSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:redSlider];
    
    //green slider
    greenSlider = [[UISlider alloc]initWithFrame:CGRectMake(width*0.15, height*2.5, width*0.8, 5)];
    greenSlider.minimumValue = 0;
    greenSlider.maximumValue = 255;
    greenSlider.value = 100;
    [greenSlider addTarget:self action:@selector(moveGreenSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:greenSlider];
    
    //blue slider
    blueSlider = [[UISlider alloc]initWithFrame:CGRectMake(width*0.15, height*3.7, width*0.8, 5)];
    blueSlider.minimumValue = 0;
    blueSlider.maximumValue = 255;
    blueSlider.value = 100;
    [blueSlider addTarget:self action:@selector(moveBlueSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:blueSlider];
    
    //red left lable
    //UILabel redLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*0.5, height*1.3, 20, 20)];
    //redLabel.text = @"Red";
    //redLabel.textColor =
    
}

-(void)collapseCell{
    NSLog(@"collapse");
    saveButton.hidden = YES;
    okButton.hidden = YES;
    redSlider.hidden = YES;
    greenSlider.hidden = YES;
    blueSlider.hidden = YES;
}

-(void)expandCell{
    NSLog(@"expand");
    saveButton.hidden = NO;
    okButton.hidden = NO;
    redSlider.hidden = NO;
    greenSlider.hidden = NO;
    blueSlider.hidden = NO;
}

-(void) clickSaveButton{
    NSLog(@"click save");
}

-(void) clickOkButton{
    NSLog(@"click ok");
}

-(void)moveRedSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    rValue = slider.value;
    NSLog(@"%ld %ld %ld",(long)rValue,(long)gValue,(long)bValue);
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
}

-(void)moveGreenSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    gValue = slider.value;
    NSLog(@"%ld %ld %ld",(long)rValue,(long)gValue,(long)bValue);
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
}

-(void)moveBlueSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    bValue = slider.value;
    NSLog(@"%ld %ld %ld",(long)rValue,(long)gValue,(long)bValue);
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
