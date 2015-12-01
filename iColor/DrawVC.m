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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
    CGFloat palateHeight = currentColorWidth / 1.5;
    CGFloat currentColorX = viewX;
    CGFloat currentColorY = viewHeight - palateHeight;
    UIButton *currentColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [currentColor setTitle:@"current" forState:UIControlStateNormal];
    currentColor.frame = CGRectMake(currentColorX, currentColorY, currentColorWidth, palateHeight);
    [currentColor setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    currentColor.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    currentColor.backgroundColor = [UIColor darkGrayColor];
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
    [simpleColor setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    simpleColor.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    simpleColor.backgroundColor = [UIColor darkGrayColor];
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
    [myColor setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    myColor.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    myColor.backgroundColor = [UIColor darkGrayColor];
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
    [createColor setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    createColor.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    createColor.backgroundColor = [UIColor darkGrayColor];
    //[createColor addTarget:self action:@selector(createColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createColor];
    
    // Draw / Erase / Clear
    
    // Draw
    UIButton *draw = [UIButton buttonWithType:UIButtonTypeCustom];
    [draw setTitle:@"draw" forState:UIControlStateNormal];
    CGFloat drawButtonWidth = viewWidth / 6.0;
    CGFloat functionBoardHeight = drawButtonWidth / 1.5;
    CGFloat drawButtonX = 0;
    CGFloat drawButtonY = viewHeight - palateHeight - functionBoardHeight;
    draw.frame = CGRectMake(drawButtonX, drawButtonY, drawButtonWidth, functionBoardHeight);
    [draw setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    draw.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    draw.backgroundColor = [UIColor darkGrayColor];
    [draw addTarget:self action:@selector(draw:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:draw];
    
    // Erase
    UIButton *eraze = [UIButton buttonWithType:UIButtonTypeCustom];
    [eraze setTitle:@"eraser" forState:UIControlStateNormal];
    CGFloat erazeButtonWidth = drawButtonWidth;
    CGFloat erazeButtonHeight = functionBoardHeight;
    CGFloat erazeButtonX = viewX + drawButtonWidth;
    CGFloat erazeButtonY = drawButtonY;
    eraze.frame = CGRectMake(erazeButtonX, erazeButtonY, erazeButtonWidth, erazeButtonHeight);
    [eraze setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    eraze.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    eraze.backgroundColor = [UIColor darkGrayColor];
    [eraze addTarget:self action:@selector(eraze:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:eraze];
    
    // Clear
    UIButton *clear = [UIButton buttonWithType:UIButtonTypeCustom];
    [clear setTitle:@"clear" forState:UIControlStateNormal];
    CGFloat clearButtonWidth = drawButtonWidth;
    CGFloat clearButtonHeight = functionBoardHeight;
    CGFloat clearButtonX = erazeButtonX + erazeButtonWidth;
    CGFloat clearButtonY = drawButtonY;
    clear.frame = CGRectMake(clearButtonX, clearButtonY, clearButtonWidth, clearButtonHeight);
    [clear setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    clear.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    clear.backgroundColor = [UIColor darkGrayColor];
    [clear addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clear];
    
    // Pen Width setting
    
    // thin
    UIButton *thin = [UIButton buttonWithType:UIButtonTypeCustom];
    [thin setTitle:@"thin" forState:UIControlStateNormal];
    CGFloat thinButtonWidth = viewWidth / 6.0;
    CGFloat thinButtonHeight = functionBoardHeight;
    CGFloat thinButtonX = clearButtonX + clearButtonWidth;
    CGFloat thinButtonY = drawButtonY;
    thin.frame = CGRectMake(thinButtonX, thinButtonY, thinButtonWidth, thinButtonHeight);
    [thin setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    thin.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    thin.backgroundColor = [UIColor darkGrayColor];
    [thin addTarget:self action:@selector(thin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thin];
    
    // medium
    UIButton *normal = [UIButton buttonWithType:UIButtonTypeCustom];
    [normal setTitle:@"normal" forState:UIControlStateNormal];
    CGFloat normalButtonWidth = viewWidth / 6.0;
    CGFloat normalButtonHeight = functionBoardHeight;
    CGFloat normalButtonX = thinButtonX + thinButtonWidth;
    CGFloat normalButtonY = drawButtonY;
    normal.frame = CGRectMake(normalButtonX, normalButtonY, normalButtonWidth, normalButtonHeight);
    [normal setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    normal.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    normal.backgroundColor = [UIColor darkGrayColor];
    [normal addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:normal];
    
    // thick
    UIButton *thick = [UIButton buttonWithType:UIButtonTypeCustom];
    [thick setTitle:@"thick" forState:UIControlStateNormal];
    CGFloat thickButtonWidth = viewWidth / 6.0;
    CGFloat thickButtonHeight = functionBoardHeight;
    CGFloat thickButtonX = normalButtonX + normalButtonWidth;
    CGFloat thickButtonY = drawButtonY;
    thick.frame = CGRectMake(thickButtonX, thickButtonY, thickButtonWidth, thickButtonHeight);
    [thick setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    thick.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:17];
    thick.backgroundColor = [UIColor darkGrayColor];
    [thick addTarget:self action:@selector(thick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thick];
    
    self.drawImage = [[UIImageView alloc]initWithFrame:CGRectMake(viewX, viewY, viewWidth, viewHeight - viewY - palateHeight - (NSInteger)functionBoardHeight)];
    self.mainImage = [[UIImageView alloc]initWithFrame:CGRectMake(viewX, viewY, viewWidth, viewHeight - viewY - palateHeight - (NSInteger)functionBoardHeight)];
    
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
//- (void)createColor:(UIButton *) button {
//    MyColorsVC *mc = [[MyColorsVC alloc] init];
//    [self.navigationController pushViewController:mc animated:YES];
//}
-(void) eraze:(UIButton *) button {
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