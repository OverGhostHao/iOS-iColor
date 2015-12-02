//
//  MixVC.m
//  iColor
//
//  Created by YuhanHao on 15/11/13.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "MixVC.h"
#import "SWRevealViewController.h"
#import "ColorItem.h"
#import <QuartzCore/QuartzCore.h>
#import "detailView.h"
#import "detailMixView.h"

@interface MixVC ()

@end

@implementation MixVC


- (void)viewDidLoad {
    [super viewDidLoad];

    colorChange = [[ColorItem alloc] init];
    numLine = 5;

    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.title = @"Mix Color";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName, nil]];
    
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:self.tableView];
    [self.tableView setBackgroundColor:[UIColor grayColor]];
    [self.tableView setScrollEnabled:NO];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.layer.cornerRadius = 10;
    button1.clipsToBounds = YES;
    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"COLOR1" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    button1.frame = CGRectMake(5, -7, 70, 30);
    button1.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:14];
    button1.backgroundColor = [UIColor darkGrayColor];
    [self.tableView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.layer.cornerRadius = 10;
    button2.clipsToBounds = YES;
    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"COLOR2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    button2.frame = CGRectMake(300, -7, 70, 30);
    button2.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:14];
    button2.backgroundColor = [UIColor darkGrayColor];
    [self.tableView addSubview:button2];
    
    //Create the slider
    NSArray *itemArray = [NSArray arrayWithObjects:@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"15",@"20", nil];
    UISegmentedControl *levelSegment = [[UISegmentedControl alloc] initWithItems:itemArray];
    levelSegment.frame = CGRectMake(77, -5, 220, 25);
    [levelSegment addTarget:self action:@selector(changeLevel:) forControlEvents:UIControlEventValueChanged];
    [levelSegment setTintColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0]];
    levelSegment.selectedSegmentIndex = 0;
    [levelSegment setBackgroundColor:[UIColor clearColor]];
    [self.tableView addSubview:levelSegment];
    
    //init random colors;
    self.color = [[NSMutableArray alloc]init];
    for (int i = 0; i < 5; i++) {
        ColorItem *newC = [[ColorItem alloc]init];
        newC = [self generateRandomColor];
        [self.color addObject:newC];
    }
    
}

-(ColorItem *) generateRandomColor {
    NSInteger red = arc4random_uniform(256);
    NSInteger green = arc4random_uniform(256);
    NSInteger blue = arc4random_uniform(256);
    ColorItem *newColor = [[ColorItem alloc]init];
    [newColor setRGB:red gValue:green bValue:blue];
    return newColor;
    
}

-(void)changeLevel: (UISegmentedControl *)sender{
    numLine = 5+sender.selectedSegmentIndex;
    if (numLine == 13) {
        numLine = 15;
    }
    if (numLine == 14) {
        numLine = 20;
    }
    
    for (int i=5; i<numLine; i++) {
        ColorItem *newC = [[ColorItem alloc] init];
        newC = [self generateRandomColor];
        [self.color addObject:newC];
    }
//    [self.tableView reloadData];
    for (int i=1; i<=(numLine-1); i++) {
        ColorItem *colorNow = [[ColorItem alloc] init];
        colorNow = [self mixColor:i andLastColor:colorBot];
        [self.color replaceObjectAtIndex:i withObject:colorNow];
    }
    
    [self.tableView reloadData];

    
}

-(void)button1Action: (id)sender{
    [self addView:1];
}

-(void)button2Action: (id)sender{
    [self addView:2];
}

-(void)addView: (NSInteger) colorIdx{
    CGFloat subviewWidth = self.view.frame.size.width - 100;
    CGFloat subviewHeight = self.view.frame.size.height - 315;
    CGFloat startX = 50;
    CGFloat startY = 120;
    
    if (colorIdx == 1) {
        colorTop = [self.color objectAtIndex:0];
    }else {
        colorBot = [self.color objectAtIndex:numLine - 1];
    }
    
    tempView = [[UIView alloc]initWithFrame:CGRectMake(startX, startY, subviewWidth, subviewHeight)];
    tempView.backgroundColor = (colorIdx == 1? colorTop.myUIColor : colorBot.myUIColor);
    tempView.layer.cornerRadius = 10;
    tempView.layer.masksToBounds = YES;
    
    //set up the sliders
    //red slider
    UISlider *redSlider = [[UISlider alloc]initWithFrame:CGRectMake(20, 10, 220, 30)];
    redSlider.minimumValue = 0;
    redSlider.maximumValue = 255;
    redSlider.value = (colorIdx == 1? colorTop.rValue : colorBot.rValue);
    redSlider.minimumTrackTintColor = [UIColor colorWithRed:231/255.0 green:76/255.0 blue:60/255.0 alpha:1];
    if (colorIdx == 1) {
        [redSlider addTarget:self action:@selector(moveRedSlider:) forControlEvents:UIControlEventValueChanged];
    }else {
        [redSlider addTarget:self action:@selector(moveRedSlider_:) forControlEvents:UIControlEventValueChanged];
    }
    [tempView addSubview:redSlider];
    
    //green slider
    UISlider *greenSlider = [[UISlider alloc]initWithFrame:CGRectMake(20, 60, 220, 30)];
    greenSlider.minimumValue = 0;
    greenSlider.maximumValue = 255;
    greenSlider.value = colorIdx == 1? colorTop.gValue : colorBot.gValue;
    greenSlider.minimumTrackTintColor = [UIColor colorWithRed:46/255.0 green:204/255.0 blue:113/255.0 alpha:1];
    if (colorIdx == 1) {
        [greenSlider addTarget:self action:@selector(moveGreenSlider:) forControlEvents:UIControlEventValueChanged];
    }else {
        [greenSlider addTarget:self action:@selector(moveGreenSlider_:) forControlEvents:UIControlEventValueChanged];
    }
    [tempView addSubview:greenSlider];
    
    //blue slider
    UISlider *blueSlider = [[UISlider alloc]initWithFrame:CGRectMake(20, 110, 220, 30)];
    blueSlider.minimumValue = 0;
    blueSlider.maximumValue = 255;
    blueSlider.value = (colorIdx == 1? colorTop.bValue: colorBot.bValue);
    blueSlider.minimumTrackTintColor = [UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1];
    if (colorIdx == 1) {
        [blueSlider addTarget:self action:@selector(moveBlueSlider:) forControlEvents:UIControlEventValueChanged];
    }else {
        [blueSlider addTarget:self action:@selector(moveBlueSlider_:) forControlEvents:UIControlEventValueChanged];
    }
    [tempView addSubview:blueSlider];
    
    //cancle button
    CGFloat buttonWidth = 70.0;
    CGFloat buttonHeight = 35.0;
    CGFloat buttonStartX = tempView.frame.size.width / 3 - buttonWidth / 2;
    CGFloat buttonStartY = tempView.frame.size.height - buttonHeight - 20;
    cancelButton= [[UIButton alloc]initWithFrame:CGRectMake(buttonStartX, buttonStartY, buttonWidth, buttonHeight)];
    [cancelButton addTarget:self action:@selector(cancleSegue) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    cancelButton.tintColor = [UIColor whiteColor];
    cancelButton.layer.cornerRadius = 8.0;
    cancelButton.layer.masksToBounds = YES;
    ColorItem *buttonColor = [[ColorItem alloc]init];
    if (colorIdx == 1) {
        [buttonColor setRGB:colorTop.rValue/2 gValue:colorTop.gValue/2 bValue:colorTop.bValue/2];
    }else {
        [buttonColor setRGB:colorBot.rValue/2 gValue:colorBot.gValue/2 bValue:colorBot.bValue/2];
    }
    cancelButton.backgroundColor = buttonColor.myUIColor;
    
    [tempView addSubview:cancelButton];
    
    //ok button
    CGFloat buttonStartX1 = tempView.frame.size.width / 3*2 - buttonWidth / 2;
    okButton= [[UIButton alloc]initWithFrame:CGRectMake(buttonStartX1, buttonStartY, buttonWidth, buttonHeight)];
    if (colorIdx == 1) {
        [okButton addTarget:self action:@selector(okSegue) forControlEvents:UIControlEventTouchUpInside];
    }else {
        [okButton addTarget:self action:@selector(okSegue_) forControlEvents:UIControlEventTouchUpInside];
    }
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    okButton.tintColor = [UIColor whiteColor];
    okButton.layer.cornerRadius = 8.0;
    okButton.layer.masksToBounds = YES;
    okButton.backgroundColor = buttonColor.myUIColor;
    
    [tempView addSubview:okButton];
    
    tempView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:tempView];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        tempView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            tempView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                tempView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];

}

-(void)cancleSegue{
    [tempView removeFromSuperview];
}

-(void)okSegue{
    [self.color replaceObjectAtIndex:0 withObject:colorTop];
    for (int i=1; i<=(numLine-2); i++) {
        ColorItem *colorNow = [[ColorItem alloc] init];
        colorNow = [self mixColor:i andLastColor:colorBot];
        [self.color replaceObjectAtIndex:i withObject:colorNow];
    }

    [self.tableView reloadData];
    [tempView removeFromSuperview];
}

-(void)okSegue_{
    //[self.color replaceObjectAtIndex:0 withObject:colorTop];
    [self.color replaceObjectAtIndex:(numLine-1) withObject:colorBot];
    for (int i=1; i<=(numLine-2); i++) {
        ColorItem *colorNow = [[ColorItem alloc] init];
        colorNow = [self mixColor:i andLastColor:colorBot];
        [self.color replaceObjectAtIndex:i withObject:colorNow];
    }

    [self.tableView reloadData];
    [tempView removeFromSuperview];
}


-(void)moveRedSlider:(id)sender {
    UISlider *slider = (UISlider*)sender;
    colorTop.rValue = slider.value;
    [colorTop updateUIColor:colorTop.rValue gValue:colorTop.gValue bValue:colorTop.bValue];
    UIColor *background = [UIColor colorWithRed:colorTop.rValue/255.0 green:colorTop.gValue/255.0 blue:colorTop.bValue/255.0 alpha:1];
    tempView.backgroundColor = background;
    colorChange.rValue = colorTop.rValue;
}

-(void)moveGreenSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    colorTop.gValue = slider.value;
    [colorTop updateUIColor:colorTop.rValue gValue:colorTop.gValue bValue:colorTop.bValue];
    UIColor *background = [UIColor colorWithRed:colorTop.rValue/255.0 green:colorTop.gValue/255.0 blue:colorTop.bValue/255.0 alpha:1];
    tempView.backgroundColor = background;
}

-(void)moveBlueSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    colorTop.bValue = slider.value;
    [colorTop updateUIColor:colorTop.rValue gValue:colorTop.gValue bValue:colorTop.bValue];
    UIColor *background = [UIColor colorWithRed:colorTop.rValue/255.0 green:colorTop.gValue/255.0 blue:colorTop.bValue/255.0 alpha:1];
    tempView.backgroundColor = background;
}

-(void)moveRedSlider_:(id)sender {
    UISlider *slider = (UISlider*)sender;
    colorBot.rValue = slider.value;
    [colorBot updateUIColor:colorBot.rValue gValue:colorBot.gValue bValue:colorBot.bValue];
    UIColor *background = [UIColor colorWithRed:colorBot.rValue/255.0 green:colorBot.gValue/255.0 blue:colorBot.bValue/255.0 alpha:1];
    tempView.backgroundColor = background;
}

-(void)moveGreenSlider_:(id)sender{
    UISlider *slider = (UISlider*)sender;
    colorBot.gValue = slider.value;
    [colorBot updateUIColor:colorBot.rValue gValue:colorBot.gValue bValue:colorBot.bValue];
    UIColor *background = [UIColor colorWithRed:colorBot.rValue/255.0 green:colorBot.gValue/255.0 blue:colorBot.bValue/255.0 alpha:1];
    tempView.backgroundColor = background;
}

-(void)moveBlueSlider_:(id)sender{
    UISlider *slider = (UISlider*)sender;
    colorBot.bValue = slider.value;
    [colorBot updateUIColor:colorBot.rValue gValue:colorBot.gValue bValue:colorBot.bValue];
    UIColor *background = [UIColor colorWithRed:colorBot.rValue/255.0 green:colorBot.gValue/255.0 blue:colorBot.bValue/255.0 alpha:1];
    tempView.backgroundColor = background;
}


-(ColorItem *)mixColor:(int) index andLastColor:(ColorItem *)lastColor{
    ColorItem *firstColor = [self.color objectAtIndex:0];
    ColorItem *colorMix = [[ColorItem alloc] init];
    
    NSInteger rlow = MIN(firstColor.rValue, lastColor.rValue);
    NSInteger rhigh = MAX(firstColor.rValue, lastColor.rValue);
    NSInteger rmix;
    if (firstColor.rValue == rlow) {
       rmix = rlow + (float)(index)/(numLine - 1) * (rhigh-rlow);
    }else{
        rmix = rhigh - (float)(index)/(numLine - 1) * (rhigh-rlow);
    }
    
    NSInteger glow = MIN(firstColor.gValue, lastColor.gValue);
    NSInteger ghigh = MAX(firstColor.gValue, lastColor.gValue);
    NSInteger gmix;
    if (firstColor.gValue == glow) {
        gmix = glow + (float)(index)/(numLine - 1) * (ghigh-glow);
    }else{
        gmix = ghigh - (float)(index)/(numLine - 1) * (ghigh-glow);
    }
    
    NSInteger blow = MIN(firstColor.bValue, lastColor.bValue);
    NSInteger bhigh = MAX(firstColor.bValue, lastColor.bValue);
    NSInteger bmix;
    if (firstColor.bValue == blow) {
        bmix = blow + (float)(index)/(numLine - 1) * (bhigh-blow);
    }else{
        bmix = bhigh - (float)(index)/(numLine - 1) * (bhigh-blow);
    }
    
    
    [colorMix setRGB:rmix gValue:gmix bValue:bmix];
    return colorMix;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.color ?1:0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.color?self.color.count :0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
    }
    
    ColorItem *thisColor;
    thisColor = [self.color objectAtIndex:indexPath.row];
    cell.backgroundColor = thisColor.myUIColor;
    cell.textLabel.text = thisColor.hexString;
    ColorItem *textColor = [[ColorItem alloc]init];
    if (thisColor.rValue + thisColor.gValue + thisColor.bValue > 200) {
        [textColor setRGB:thisColor.rValue/2.0 gValue:thisColor.gValue/2.0 bValue:thisColor.bValue/2.0];
    }else {
        [textColor setRGB:255.0-thisColor.rValue gValue:255.0-thisColor.gValue bValue:255.0-thisColor.bValue];
    }
    cell.textLabel.textColor = textColor.myUIColor;
    [cell.textLabel setFont:[UIFont fontWithName:@"American Typewriter" size:20]];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ColorItem *tc = [self.color objectAtIndex:indexPath.row];

    CGFloat subviewWidth = self.view.frame.size.width - 100;
    CGFloat subviewHeight = self.view.frame.size.height - 315;
    CGFloat startX = 50;
    CGFloat startY = 120;
    
    detailMixView *tempView1 = [[detailMixView alloc]initWithFrame:CGRectMake(startX, startY, subviewWidth, subviewHeight)];
    [tempView1 setContent:tc];
    
    tempView1.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:tempView1];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        tempView1.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            tempView1.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                tempView1.transform = CGAffineTransformIdentity;
            }];
        }];
    }];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (self.tableView.frame.size.height-98)/numLine;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
