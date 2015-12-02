//
//  DrawVC.m
//  iColor
//
//  Created by YuhanHao on 15/11/13.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "DrawVC.h"
#import "SWRevealViewController.h"

@interface DrawVC ()
@property UIImageView *drawImage;
@property UIImageView *mainImage;
@property UIButton *currentC;
@property UIImage *savedImage;

@end

@implementation DrawVC

UIButton *currentColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpMenu];
    
    //Set the list page for navigation
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        //        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.title = @"Composing";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName, nil]];
    
    //draw init
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brush = 5.0;
    opacity = 1.0;

}

-(void) setUpMenu {
    CGFloat viewX = self.view.frame.origin.x;
    CGFloat viewY = self.view.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
    
    //Save Button.
    CGFloat saveButtonWidth = 70;
    CGFloat saveButtonHeight = 50;
    CGFloat saveButtonX = viewX + viewWidth * 0.78;
    CGFloat saveButtonY = viewY + viewHeight * 0.05;
    UIButton *save = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    save.frame = CGRectMake(saveButtonX, saveButtonY, saveButtonWidth, saveButtonHeight);
    [save setTitle:@"Save" forState:UIControlStateNormal];
    save.layer.cornerRadius = 10;
    save.clipsToBounds = YES;
    [save setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    save.backgroundColor = [UIColor darkGrayColor];
    
    [save addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:save];
    
    
    //Choose color palate.
    
    //current color:
    CGFloat currentColorWidth = viewWidth / 4.0;
    CGFloat palateHeight = currentColorWidth;
    CGFloat currentColorX = viewX;
    CGFloat currentColorY = viewHeight - palateHeight;
    currentColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [currentColor setTitle:@"current" forState:UIControlStateNormal];
    currentColor.frame = CGRectMake(currentColorX, currentColorY, currentColorWidth, palateHeight);
    
    [currentColor setTitleColor:[UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1] forState:UIControlStateNormal];
    currentColor.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:22];
    //currentColor.backgroundColor = [UIColor darkGrayColor];
    currentColor.backgroundColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0/255.0 alpha:1];
    [self.view addSubview:currentColor];
    self.currentC = currentColor;
    
    //choose from built-in colors.
    UIButton *simpleColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [simpleColor setTitle:@"simple" forState:UIControlStateNormal];
    CGFloat simpleButtonWidth = viewWidth / 4.0;
    CGFloat simpleButtonHeight = palateHeight;
    CGFloat simpleButtonX = viewX + 1.0 * simpleButtonWidth;
    CGFloat simpleButtonY = viewHeight - simpleButtonHeight;
    simpleColor.frame = CGRectMake(simpleButtonX, simpleButtonY, simpleButtonWidth, simpleButtonHeight);
    UIImage *simpleColorImage = [UIImage imageNamed:@"simpleColors"];
    [simpleColor setImage:simpleColorImage forState:UIControlStateNormal];
    simpleColor.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    simpleColor.backgroundColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0/255.0 alpha:1];
    simpleColor.showsTouchWhenHighlighted = YES;
    [simpleColor addTarget:self action:@selector(simpleColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:simpleColor];
    
    //choose from my saved colors.
    UIButton *myColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [myColor setTitle:@"my colors" forState:UIControlStateNormal];
    CGFloat myColorButtonWidth = viewWidth / 4.0;
    CGFloat myColorButtonHeight = palateHeight;
    CGFloat myColorButtonX = viewX + 2.0 * myColorButtonWidth;
    CGFloat myColorButtonY = viewHeight - myColorButtonHeight;
    myColor.frame = CGRectMake(myColorButtonX, myColorButtonY, myColorButtonWidth, myColorButtonHeight);
    UIImage *myColorImage = [UIImage imageNamed:@"favorite"];
    [myColor setImage:myColorImage forState:UIControlStateNormal];
    myColor.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    myColor.backgroundColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0/255.0 alpha:1];
    myColor.showsTouchWhenHighlighted = YES;

    [myColor addTarget:self action:@selector(myColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myColor];
    
    //choose color from creating a new color.
    UIButton *createColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [createColor setTitle:@"create" forState:UIControlStateNormal];
    CGFloat createButtonWidth = viewWidth / 4.0;
    CGFloat createButtonHeight = palateHeight;
    CGFloat createButtonX = viewX + 3.0 * createButtonWidth;
    CGFloat createButtonY = viewHeight - createButtonHeight;
    createColor.frame = CGRectMake(createButtonX, createButtonY, createButtonWidth, createButtonHeight);
    UIImage *createColorImage = [UIImage imageNamed:@"palatte"];
    [createColor setImage:createColorImage forState:UIControlStateNormal];
    createColor.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    createColor.backgroundColor = [UIColor colorWithRed:255/255.0 green:204/255.0 blue:0/255.0 alpha:1];
    createColor.showsTouchWhenHighlighted = YES;

    [createColor addTarget:self action:@selector(createColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createColor];
    
    // Draw / Erase / Clear
    
    // Draw
    UIButton *draw = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat drawButtonWidth = viewWidth / 6.0;
    CGFloat functionBoardHeight = drawButtonWidth;
    CGFloat drawButtonX = 0;
    CGFloat drawButtonY = viewHeight - palateHeight - functionBoardHeight;
    draw.frame = CGRectMake(drawButtonX, drawButtonY, drawButtonWidth, functionBoardHeight);
    UIImage *drawImage = [UIImage imageNamed:@"pencil1"];
    [draw setImage:drawImage forState:UIControlStateNormal];
    draw.backgroundColor = [UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1];
    draw.showsTouchWhenHighlighted = YES;

    
    [draw addTarget:self action:@selector(draw:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:draw];
    
    // Erase
    UIButton *erase = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat eraseButtonWidth = drawButtonWidth;
    CGFloat eraseButtonHeight = functionBoardHeight;
    CGFloat eraseButtonX = viewX + drawButtonWidth;
    CGFloat eraseButtonY = drawButtonY;
    erase.frame = CGRectMake(eraseButtonX, eraseButtonY, eraseButtonWidth, eraseButtonHeight);
    UIImage *eraseImage = [UIImage imageNamed:@"Eraser1"];
    [erase setImage:eraseImage forState:UIControlStateNormal];
    erase.backgroundColor = [UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1];
    erase.showsTouchWhenHighlighted = YES;

    
    [erase addTarget:self action:@selector(erase:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:erase];
    
    // Clear
    UIButton *clear = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat clearButtonWidth = drawButtonWidth;
    CGFloat clearButtonHeight = functionBoardHeight;
    CGFloat clearButtonX = eraseButtonX + eraseButtonWidth;
    CGFloat clearButtonY = drawButtonY;
    clear.frame = CGRectMake(clearButtonX, clearButtonY, clearButtonWidth, clearButtonHeight);
    UIImage *clearImage = [UIImage imageNamed:@"trashbin1"];
    [clear setImage:clearImage forState:UIControlStateNormal];
    clear.backgroundColor = [UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1];
    clear.showsTouchWhenHighlighted = YES;

    [clear addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clear];
    
    // Pen Width setting
    
    // thin
    UIButton *thin = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat thinButtonWidth = viewWidth / 6.0;
    CGFloat thinButtonHeight = functionBoardHeight;
    CGFloat thinButtonX = clearButtonX + clearButtonWidth;
    CGFloat thinButtonY = drawButtonY;
    thin.frame = CGRectMake(thinButtonX, thinButtonY, thinButtonWidth, thinButtonHeight);
    UIImage *thinImage = [UIImage imageNamed:@"dot_test"];
    [thin setImage:thinImage forState:UIControlStateNormal];
    thin.imageEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
    thin.backgroundColor = [UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1];
    thin.showsTouchWhenHighlighted = YES;

    [thin addTarget:self action:@selector(thin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thin];
    
    // medium
    UIButton *normal = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat normalButtonWidth = viewWidth / 6.0;
    CGFloat normalButtonHeight = functionBoardHeight;
    CGFloat normalButtonX = thinButtonX + thinButtonWidth;
    CGFloat normalButtonY = drawButtonY;
    normal.frame = CGRectMake(normalButtonX, normalButtonY, normalButtonWidth, normalButtonHeight);
    thin.frame = CGRectMake(thinButtonX, thinButtonY, thinButtonWidth, thinButtonHeight);
    UIImage *normalImage = [UIImage imageNamed:@"dot_test"];
    [normal setImage:normalImage forState:UIControlStateNormal];
    normal.imageEdgeInsets = UIEdgeInsetsMake( 8, 8, 8, 8);
    normal.backgroundColor = [UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1];
    normal.showsTouchWhenHighlighted = YES;

    [normal addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:normal];
    
    // thick
    UIButton *thick = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat thickButtonWidth = viewWidth / 6.0;
    CGFloat thickButtonHeight = functionBoardHeight;
    CGFloat thickButtonX = normalButtonX + normalButtonWidth;
    CGFloat thickButtonY = drawButtonY;
    thick.frame = CGRectMake(thickButtonX, thickButtonY, thickButtonWidth, thickButtonHeight);
    UIImage *thickImage = [UIImage imageNamed:@"dot_test"];
    [thick setImage:thickImage forState:UIControlStateNormal];
    thick.backgroundColor = [UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1];
    thick.showsTouchWhenHighlighted = YES;

    [thick addTarget:self action:@selector(thick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thick];
    
    self.drawImage = [[UIImageView alloc]initWithFrame:CGRectMake(viewX, viewY, viewWidth, (int)(viewHeight - viewY - palateHeight - functionBoardHeight))];
    self.mainImage = [[UIImageView alloc]initWithFrame:CGRectMake(viewX, viewY, viewWidth, (int)(viewHeight - viewY - palateHeight - functionBoardHeight))];
    
    [self.view addSubview:self.mainImage];
    [self.view addSubview:self.drawImage];
    
}

-(void)changeColor:(NSString *)s {
    unsigned int hexInt = 0;
    NSScanner *scanner = [NSScanner scannerWithString:s];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];
    red   = ((hexInt & 0xFF0000) >> 16) / 255.0f;
    green = ((hexInt & 0x00FF00) >>  8) / 255.0f;
    blue  =  (hexInt & 0x0000FF) / 255.0f;
    UIColor *cc = [[UIColor alloc] initWithRed:red green:green blue:blue alpha:1.0];
    [self.currentC setBackgroundColor:cc];
}

- (void)simpleColor:(UIButton *) button {
    SimpleColors *sc = [[SimpleColors alloc] init];
    sc.draw = self;
    [self.navigationController pushViewController:sc animated:YES];
}

- (void)myColor:(UIButton *) button {
    SimpleSavedColorVC *mc = [[SimpleSavedColorVC alloc] init];
    mc.draw = self;
    [self.navigationController pushViewController:mc animated:YES];
}

- (void)createColor:(UIButton *) button {
    [self addView];
}

-(void)addView{
    CGFloat subviewWidth = self.view.frame.size.width - 100;
    CGFloat subviewHeight = self.view.frame.size.height - 315;
    CGFloat startX = 50;
    CGFloat startY = 120;
    
    customizedColor = [[ColorItem alloc]init];
    [customizedColor setRGB:230 gValue:126 bValue:34];
    
    tView = [[UIView alloc]initWithFrame:CGRectMake(startX, startY, subviewWidth, subviewHeight)];
    [self.view addSubview:tView];
    //tView.backgroundColor = [UIColor grayColor];
    tView.backgroundColor = customizedColor.myUIColor;
    tView.layer.cornerRadius = 10;
    tView.layer.masksToBounds = YES;
    
    //set up the sliders
    //red slider
    UISlider *redSlider = [[UISlider alloc]initWithFrame:CGRectMake(20, 10, 220, 30)];
    redSlider.minimumValue = 0;
    redSlider.maximumValue = 255;
    redSlider.value = customizedColor.rValue;
    redSlider.minimumTrackTintColor = [UIColor colorWithRed:231/255.0 green:76/255.0 blue:60/255.0 alpha:1];
    [redSlider addTarget:self action:@selector(moveRedSlider:) forControlEvents:UIControlEventValueChanged];
    [tView addSubview:redSlider];
    
    //green slider
    UISlider *greenSlider = [[UISlider alloc]initWithFrame:CGRectMake(20, 60, 220, 30)];
    greenSlider.minimumValue = 0;
    greenSlider.maximumValue = 255;
    greenSlider.value = customizedColor.gValue;
    greenSlider.minimumTrackTintColor = [UIColor colorWithRed:46/255.0 green:204/255.0 blue:113/255.0 alpha:1];
    [greenSlider addTarget:self action:@selector(moveGreenSlider:) forControlEvents:UIControlEventValueChanged];
    [tView addSubview:greenSlider];
    
    //blue slider
    UISlider *blueSlider = [[UISlider alloc]initWithFrame:CGRectMake(20, 110, 220, 30)];
    blueSlider.minimumValue = 0;
    blueSlider.maximumValue = 255;
    blueSlider.value = customizedColor.bValue;
    blueSlider.minimumTrackTintColor = [UIColor colorWithRed:52/255.0 green:152/255.0 blue:219/255.0 alpha:1];
    [blueSlider addTarget:self action:@selector(moveBlueSlider:) forControlEvents:UIControlEventValueChanged];
    [tView addSubview:blueSlider];
    
    //cancle button
    CGFloat buttonWidth = 70.0;
    CGFloat buttonHeight = 35.0;
    CGFloat buttonStartX = tView.frame.size.width / 3 - buttonWidth / 2;
    CGFloat buttonStartY = tView.frame.size.height - buttonHeight - 20;
    cancelbutton= [[UIButton alloc]initWithFrame:CGRectMake(buttonStartX, buttonStartY, buttonWidth, buttonHeight)];
    [cancelbutton addTarget:self action:@selector(cancleSegue) forControlEvents:UIControlEventTouchUpInside];
    [cancelbutton setTitle:@"Cancel" forState:UIControlStateNormal];
    cancelbutton.tintColor = [UIColor whiteColor];
    cancelbutton.layer.cornerRadius = 8.0;
    cancelbutton.layer.masksToBounds = YES;
    ColorItem *buttonColor = [[ColorItem alloc]init];
    [buttonColor setRGB:customizedColor.rValue/2 gValue:customizedColor.gValue/2 bValue:customizedColor.bValue/2];
    cancelbutton.backgroundColor = buttonColor.myUIColor;
    [tView addSubview:cancelbutton];
    
    //ok button
    CGFloat buttonStartX1 = tView.frame.size.width / 3*2 - buttonWidth / 2;
    okbutton= [[UIButton alloc]initWithFrame:CGRectMake(buttonStartX1, buttonStartY, buttonWidth, buttonHeight)];
    [okbutton addTarget:self action:@selector(okSegue) forControlEvents:UIControlEventTouchUpInside];
    [okbutton setTitle:@"OK" forState:UIControlStateNormal];
    okbutton.tintColor = [UIColor whiteColor];
    okbutton.layer.cornerRadius = 8.0;
    okbutton.layer.masksToBounds = YES;
    okbutton.backgroundColor = buttonColor.myUIColor;
    [tView addSubview:okbutton];
    
    tView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    [UIView animateWithDuration:0.3/1.5 animations:^{
        tView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            tView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                tView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
}

-(void)cancleSegue{
    [tView removeFromSuperview];
}

-(void)okSegue{
    [currentColor setBackgroundColor:customizedColor.myUIColor];
    red = customizedColor.rValue / 255.0;
    green = customizedColor.gValue / 255.0;
    blue = customizedColor.bValue / 255.0;
    
    [tView removeFromSuperview];
}

-(void)moveRedSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    customizedColor.rValue = slider.value;
    [customizedColor updateUIColor:customizedColor.rValue gValue:customizedColor.gValue bValue:customizedColor.bValue];
    UIColor *background = [UIColor colorWithRed:customizedColor.rValue/255.0 green:customizedColor.gValue/255.0 blue:customizedColor.bValue/255.0 alpha:1];
    tView.backgroundColor = background;
}

-(void)moveGreenSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    customizedColor.gValue = slider.value;
    [customizedColor updateUIColor:customizedColor.rValue gValue:customizedColor.gValue bValue:customizedColor.bValue];

    UIColor *background = [UIColor colorWithRed:customizedColor.rValue/255.0 green:customizedColor.gValue/255.0 blue:customizedColor.bValue/255.0 alpha:1];
    tView.backgroundColor = background;
}

-(void)moveBlueSlider:(id)sender{
    UISlider *slider = (UISlider*)sender;
    customizedColor.bValue = slider.value;
    [customizedColor updateUIColor:customizedColor.rValue gValue:customizedColor.gValue bValue:customizedColor.bValue];

    UIColor *background = [UIColor colorWithRed:customizedColor.rValue/255.0 green:customizedColor.gValue/255.0 blue:customizedColor.bValue/255.0 alpha:1];
    tView.backgroundColor = background;
}

-(void) erase:(UIButton *) button {
    red = 1.0;
    green = 1.0;
    blue = 1.0;
}

-(void) draw:(UIButton *) button {
    UIColor *c = self.currentC.backgroundColor;
    [c getRed:&red green:&green blue:&blue alpha:nil];
}

-(void) clear:(UIButton *) button {
    self.mainImage.image = nil;
}

-(void) save:(UIButton *) button {
    UIImage *image = self.mainImage.image;
    if (image) {
        GlobalVars *globals = [GlobalVars sharedInstance];
        if (![globals.savedImages containsObject:image]) {
            [globals.savedImages addObject:image];
        }
        
    }
}

- (void)thin:(UIButton *) button {
    brush = 3.0;
}

- (void)normal:(UIButton *) button {
    brush = 5.0;
}

- (void)thick:(UIButton *) button {
    brush = 10.0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.drawImage];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.drawImage];
    
    UIGraphicsBeginImageContext(self.drawImage.frame.size);
    [self.drawImage.image drawInRect:CGRectMake(0, 0, self.drawImage.frame.size.width, self.drawImage.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.drawImage setAlpha:opacity];
    UIGraphicsEndImageContext();
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.drawImage.frame.size);
        [self.drawImage.image drawInRect:CGRectMake(0, 0, self.drawImage.frame.size.width, self.drawImage.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.mainImage.frame.size.width, self.mainImage.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.drawImage.image drawInRect:CGRectMake(0, 0, self.drawImage.frame.size.width, self.drawImage.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.drawImage.image = nil;
    UIGraphicsEndImageContext();
    
}


@end