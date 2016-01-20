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

@synthesize myFont;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier color:(ColorItem *)color{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.accessoryType = UITableViewCellAccessoryNone;
        mycolor = color;
        rValue = color.rValue;
        gValue = color.gValue;
        bValue = color.bValue;
        self.textLabel.text = mycolor.hexString;
        [self createButtonSlider];
        [self collapseCell];
    }
    return self;
}

-(void) createButtonSlider{
    
    myFont = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
    CGRect cellFrame = self.frame;
    CGFloat width = CGRectGetWidth(cellFrame);
    CGFloat height = CGRectGetHeight(cellFrame);
    self.contentView.frame = cellFrame;
    
    //save button
    saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.layer.cornerRadius = 10;
    saveButton.clipsToBounds = YES;
    [saveButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    saveButton.titleLabel.font = myFont;
    saveButton.backgroundColor = [UIColor darkGrayColor];
    saveButton.frame = CGRectMake(width*0.15, height*4.8, width*70/320, height*50/44);
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(clickSaveButton) forControlEvents:UIControlEventTouchUpInside];
    saveButton.showsTouchWhenHighlighted = YES;
    [self addSubview:saveButton];
    
    //ok button
    okButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    okButton.layer.cornerRadius = 10;
    okButton.clipsToBounds = YES;
    [okButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    okButton.titleLabel.font = myFont;
    okButton.backgroundColor = [UIColor darkGrayColor];
    okButton.frame = CGRectMake(width*0.85, height*4.8, width*70/320, height*50/44);
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(clickOkButton) forControlEvents:UIControlEventTouchUpInside];
    okButton.showsTouchWhenHighlighted = YES;
    [self addSubview:okButton];
    
    //red slider
    redSlider = [[UISlider alloc]initWithFrame:CGRectMake(width*0.25, height*1.3, width*0.75, height*10/44)];
    redSlider.minimumValue = 0;
    redSlider.maximumValue = 255;
    redSlider.value = rValue;
    redSlider.minimumTrackTintColor = [UIColor colorWithRed:231/255.0 green:76/255.0 blue:60/255.0 alpha:1];
    [redSlider addTarget:self action:@selector(moveRedSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:redSlider];
    
    //green slider
    greenSlider = [[UISlider alloc]initWithFrame:CGRectMake(width*0.25, height*2.5, width*0.75, height*10/44)];
    greenSlider.minimumValue = 0;
    greenSlider.maximumValue = 255;
    greenSlider.value = gValue;
    greenSlider.minimumTrackTintColor = [UIColor colorWithRed:46/255.0 green:204/255.0 blue:113/255.0 alpha:1];
    [greenSlider addTarget:self action:@selector(moveGreenSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:greenSlider];
    
    //blue slider
    blueSlider = [[UISlider alloc]initWithFrame:CGRectMake(width*0.25, height*3.7, width*0.75, height*10/44)];
    blueSlider.minimumValue = 0;
    blueSlider.maximumValue = 255;
    blueSlider.value = bValue;
    blueSlider.minimumTrackTintColor = [UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1];
    [blueSlider addTarget:self action:@selector(moveBlueSlider:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:blueSlider];
    
    //red left lable
    rLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*0.05, height*1.1, width*60/320, height*30/44)];
    rLabel.text = @"Red";
    rLabel.textColor = [UIColor colorWithRed:231/255.0 green:76/255.0 blue:60/255.0 alpha:1];
    rLabel.font = myFont;
    [self addSubview:rLabel];
    
    //green left lable
    gLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*0.05, height*2.3, width*60/320, height*30/44)];
    gLabel.text = @"Green";
    gLabel.textColor = [UIColor colorWithRed:46/255.0 green:204/255.0 blue:113/255.0 alpha:1];
    gLabel.font = myFont;
    [self addSubview:gLabel];
    
    //blue left labl3
    bLabel = [[UILabel alloc]initWithFrame:CGRectMake(width*0.05, height*3.5, width*60/320, height*30/44)];
    bLabel.text = @"Blue";
    bLabel.textColor = [UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1];
    bLabel.font = myFont;
    [self addSubview:bLabel];
    
    //red value indicator
    rIndicator = [[UILabel alloc]initWithFrame:CGRectMake(width*1.03, height*1.1, width*60/320, height*30/44)];
    rIndicator.text = [NSString stringWithFormat:@"%ld",(long)rValue];
    rIndicator.textColor = [UIColor colorWithRed:231/255.0 green:76/255.0 blue:60/255.0 alpha:1];
    rIndicator.font = myFont;
    [self addSubview:rIndicator];
    
    //green value indicator
    gIndicator = [[UILabel alloc]initWithFrame:CGRectMake(width*1.03, height*2.3, width*60/320, height*30/44)];
    gIndicator.text = [NSString stringWithFormat:@"%ld",(long)gValue];
    gIndicator.textColor = [UIColor colorWithRed:46/255.0 green:204/255.0 blue:113/255.0 alpha:1];
    gIndicator.font = myFont;
    [self addSubview:gIndicator];
    
    //blue value indicator
    bIndicator = [[UILabel alloc]initWithFrame:CGRectMake(width*1.03, height*3.5, width*60/320, height*30/44)];
    bIndicator.text = [NSString stringWithFormat:@"%ld",(long)bValue];
    bIndicator.textColor = [UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1];
    bIndicator.font = myFont;
    [self addSubview:bIndicator];
    
}

-(void)collapseCell{
    self.backgroundColor = mycolor.myUIColor;
    redSlider.value = mycolor.rValue;
    greenSlider.value = mycolor.gValue;
    blueSlider.value = mycolor.bValue;
    
    rIndicator.text = [NSString stringWithFormat:@"%ld", (long)mycolor.rValue];
    gIndicator.text = [NSString stringWithFormat:@"%ld", (long)mycolor.gValue];
    bIndicator.text = [NSString stringWithFormat:@"%ld", (long)mycolor.bValue];
    
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
}

-(void)expandCell{
    self.backgroundColor = mycolor.myUIColor;
    redSlider.value = mycolor.rValue;
    greenSlider.value = mycolor.gValue;
    blueSlider.value = mycolor.bValue;
    
    rIndicator.text = [NSString stringWithFormat:@"%ld", (long)mycolor.rValue];
    gIndicator.text = [NSString stringWithFormat:@"%ld", (long)mycolor.gValue];
    bIndicator.text = [NSString stringWithFormat:@"%ld", (long)mycolor.bValue];
    
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
}

-(void) clickSaveButton{
    [mycolor setRGB:rValue gValue:gValue bValue:bValue];
    GlobalVars *globals = [GlobalVars sharedInstance];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.hexString contains[c] %@", mycolor.hexString];
    NSArray *results = [globals.savedColors filteredArrayUsingPredicate:predicate];
    if (results.count == 0) {
        //[globals.savedColors addObject:mycolor];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *encodedObject = [defaults objectForKey:@"savedMyColors"];
        NSMutableArray *preColors = [[NSMutableArray alloc] init];
        preColors = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
        [preColors addObject:mycolor];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"savedMyColors"];
        NSData *newData = [NSKeyedArchiver archivedDataWithRootObject:preColors];
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:newData forKey:@"savedMyColors"];
        [def synchronize];
        
    }
}

-(void) clickOkButton{
    if ([self.delegate respondsToSelector:@selector(updateColor:newColor:)]){
        [mycolor setRGB:rValue gValue:gValue bValue:bValue];
        [self.delegate updateColor:self.tag newColor:mycolor];
    }
}

-(void)moveRedSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    rValue = slider.value;
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
    rIndicator.text = [NSString stringWithFormat:@"%ld",(long)rValue];
}

-(void)moveGreenSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    gValue = slider.value;
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
    gIndicator.text = [NSString stringWithFormat:@"%ld",(long)gValue];
}

-(void)moveBlueSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    bValue = slider.value;
    UIColor *background = [UIColor colorWithRed:rValue/255.0 green:gValue/255.0 blue:bValue/255.0 alpha:1];
    self.backgroundColor = background;
    bIndicator.text = [NSString stringWithFormat:@"%ld",(long)bValue];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
