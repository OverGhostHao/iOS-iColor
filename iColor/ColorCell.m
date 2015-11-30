//
//  ColorCell.m
//  iColor
//
//  Created by weiqi on 11/28/15.
//  Copyright (c) 2015 Skejul. All rights reserved.
//

#import "ColorCell.h"

@implementation ColorCell

@synthesize mycolor;
@synthesize rValue;
@synthesize gValue;
@synthesize bValue;

@synthesize saveButton;
@synthesize okButton;

@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;

@synthesize rLabel;
@synthesize gLabel;
@synthesize bLabel;

@synthesize rIndicator;
@synthesize gIndicator;
@synthesize bIndicator;

@synthesize delegate;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier color:(ColorItem *)color{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.accessoryType = UITableViewCellAccessoryNone;
        mycolor = color;
        rValue = color.rValue;
        gValue = color.gValue;
        bValue = color.bValue;
        //NSLog(@"init %ld %ld %ld ",(long)rValue,(long)gValue, (long)bValue);

        //self.backgroundColor = mycolor.myUIColor;
        self.textLabel.text = mycolor.hexString;
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
    redSlider.value = rValue;
    [redSlider addTarget:self action:@selector(moveRedSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:redSlider];
    
    //green slider
    greenSlider = [[UISlider alloc]initWithFrame:CGRectMake(width*0.15, height*2.5, width*0.8, 5)];
    greenSlider.minimumValue = 0;
    greenSlider.maximumValue = 255;
    greenSlider.value = gValue;
    [greenSlider addTarget:self action:@selector(moveGreenSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:greenSlider];
    
    //blue slider
    blueSlider = [[UISlider alloc]initWithFrame:CGRectMake(width*0.15, height*3.7, width*0.8, 5)];
    blueSlider.minimumValue = 0;
    blueSlider.maximumValue = 255;
    blueSlider.value = bValue;
    [blueSlider addTarget:self action:@selector(moveBlueSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:blueSlider];
    
    //red left lable
    rLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*0.05, height*1.1, 20, 20)];
    rLabel.text = @"R";
    rLabel.textColor = [UIColor blackColor];
    [self addSubview:rLabel];
    
    //green left lable
    gLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*0.05, height*2.3, 20, 20)];
    gLabel.text = @"G";
    gLabel.textColor = [UIColor blackColor];
    [self addSubview:gLabel];
    
    //blue left labl3
    bLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*0.05, height*3.5, 20, 20)];
    bLabel.text = @"B";
    bLabel.textColor = [UIColor blackColor];
    [self addSubview:bLabel];
    
    //red value indicator
    rIndicator = [[UILabel alloc]initWithFrame:CGRectMake(width*1, height*1.1, 30,20)];
    rIndicator.text = [NSString stringWithFormat:@"%ld",rValue];
    rIndicator.textColor = [UIColor blackColor];
    [self addSubview:rIndicator];
    
    //green value indicator
    gIndicator = [[UILabel alloc]initWithFrame:CGRectMake(width*1, height*2.3, 30,20)];
    gIndicator.text = [NSString stringWithFormat:@"%ld",gValue];
    gIndicator.textColor = [UIColor blackColor];
    [self addSubview:gIndicator];
    
    //blue value indicator
    bIndicator = [[UILabel alloc]initWithFrame:CGRectMake(width*1, height*3.5, 30,20)];
    bIndicator.text = [NSString stringWithFormat:@"%ld",bValue];
    bIndicator.textColor = [UIColor blackColor];
    [self addSubview:bIndicator];
    
    
}

-(void)collapseCell{
    self.backgroundColor = mycolor.myUIColor;
    redSlider.value = mycolor.rValue;
    greenSlider.value = mycolor.gValue;
    blueSlider.value = mycolor.bValue;
    self.textLabel.hidden = NO;
    saveButton.hidden = YES;
    okButton.hidden = YES;
    redSlider.hidden = YES;
    greenSlider.hidden = YES;
    blueSlider.hidden = YES;
    rLabel.hidden = YES;
    gLabel.hidden = YES;
    bLabel.hidden = YES;
    rIndicator.hidden = YES;
    gIndicator.hidden = YES;
    bIndicator.hidden = YES;

    
    //NSLog(@"collapse %f %f %f %ld ",redSlider.value,greenSlider.value, blueSlider.value,(long)self.tag);
    //NSLog(@"collapse %ld %ld %ld %ld ",(long)rValue,(long)gValue, (long)bValue,(long)self.tag);
}

-(void)expandCell{
    self.backgroundColor = mycolor.myUIColor;
    redSlider.value = mycolor.rValue;
    greenSlider.value = mycolor.gValue;
    blueSlider.value = mycolor.bValue;
    self.textLabel.hidden = YES;
    saveButton.hidden = NO;
    okButton.hidden = NO;
    redSlider.hidden = NO;
    greenSlider.hidden = NO;
    blueSlider.hidden = NO;
    rLabel.hidden = NO;
    gLabel.hidden = NO;
    bLabel.hidden = NO;
    rIndicator.hidden = NO;
    gIndicator.hidden = NO;
    bIndicator.hidden = NO;
    //NSLog(@"expand %f %f %f %ld ",redSlider.value,greenSlider.value, blueSlider.value,(long)self.tag);
    //NSLog(@"expand %ld %ld %ld %ld ",(long)rValue,(long)gValue, (long)bValue,(long)self.tag);
}


-(void) clickSaveButton{
    //NSLog(@"click save");
    [mycolor setRGB:rValue gValue:gValue bValue:bValue];
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:mycolor];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger count;
    if([defaults integerForKey:@"savedColorCount"] == 0){
        [defaults setInteger:1 forKey:@"savedColorCount"];
        count = 1;
        //NSLog(@"%ld",(long)count);
    }
    else{
        count = [defaults integerForKey:@"savedColorCount"];
        //NSLog(@"%ld",(long)count);
    }
    NSString *countString = [NSString stringWithFormat:@"%ld",count];
    [defaults setObject:encodedObject forKey:countString];
    [defaults synchronize];
}

-(void) clickOkButton{
    //NSLog(@"click ok, %ld", (long)self.tag);
    
    if ([self.delegate respondsToSelector:@selector(updateColor:newColor:)]){
        [mycolor setRGB:rValue gValue:gValue bValue:bValue];
        [self.delegate updateColor:self.tag newColor:mycolor];
    }
}

-(void)moveRedSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    rValue = slider.value;
    //NSLog(@"%ld %ld %ld",(long)rValue,(long)gValue,(long)bValue);
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
    rIndicator.text = [NSString stringWithFormat:@"%ld",rValue];
    //NSInteger index = self.tag;
}

-(void)moveGreenSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    gValue = slider.value;
    //NSLog(@"%ld %ld %ld",(long)rValue,(long)gValue,(long)bValue);
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
    gIndicator.text = [NSString stringWithFormat:@"%ld",gValue];

}

-(void)moveBlueSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    bValue = slider.value;
    //NSLog(@"%ld %ld %ld",(long)rValue,(long)gValue,(long)bValue);
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
    bIndicator.text = [NSString stringWithFormat:@"%ld",bValue];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
