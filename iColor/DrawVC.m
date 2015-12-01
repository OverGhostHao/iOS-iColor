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
    
    self.drawImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height / 2)];
    self.mainImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height / 2)];
    
    [self.view addSubview:self.mainImage];
    [self.view addSubview:self.drawImage];
    
    UIButton *thin = [UIButton buttonWithType:UIButtonTypeCustom];
    [thin setTitle:@"thin" forState:UIControlStateNormal];
    thin.frame = CGRectMake(self.view.frame.origin.x + 10, self.view.frame.origin.y + self.view.frame.size.height / 2, 0, 0);
    [thin sizeToFit];
    [thin setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [thin addTarget:self action:@selector(thin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thin];
    
    UIButton *normal = [UIButton buttonWithType:UIButtonTypeCustom];
    [normal setTitle:@"normal" forState:UIControlStateNormal];
    normal.frame = CGRectMake(self.view.frame.origin.x + 10, self.view.frame.origin.y + self.view.frame.size.height / 2 + thin.frame.size.height, 0, 0);
    [normal sizeToFit];
    [normal setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [normal addTarget:self action:@selector(normal:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:normal];
    
    UIButton *thick = [UIButton buttonWithType:UIButtonTypeCustom];
    [thick setTitle:@"thick" forState:UIControlStateNormal];
    thick.frame = CGRectMake(self.view.frame.origin.x + 10, self.view.frame.origin.y + self.view.frame.size.height / 2 + thin.frame.size.height + normal.frame.size.height, 0, 0);
    [thick sizeToFit];
    [thick setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [thick addTarget:self action:@selector(thick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thick];
    
    UIButton *eraze = [UIButton buttonWithType:UIButtonTypeCustom];
    [eraze setTitle:@"erazer" forState:UIControlStateNormal];
    eraze.frame = CGRectMake(self.view.frame.origin.x + 150, self.view.frame.origin.y + self.view.frame.size.height / 2 + thin.frame.size.height, 0, 0);
    [eraze sizeToFit];
    [eraze setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [eraze addTarget:self action:@selector(eraze:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:eraze];
    
    UIButton *clear = [UIButton buttonWithType:UIButtonTypeCustom];
    [clear setTitle:@"clear" forState:UIControlStateNormal];
    clear.frame = CGRectMake(self.view.frame.origin.x + 150, self.view.frame.origin.y + self.view.frame.size.height / 2 + thin.frame.size.height + normal.frame.size.height, 0, 0);
    [clear sizeToFit];
    [clear setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [clear addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clear];
    
    UIButton *draw = [UIButton buttonWithType:UIButtonTypeCustom];
    [draw setTitle:@"draw" forState:UIControlStateNormal];
    draw.frame = CGRectMake(self.view.frame.origin.x + 150, self.view.frame.origin.y + self.view.frame.size.height / 2, 0, 0);
    [draw sizeToFit];
    [draw setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [draw addTarget:self action:@selector(draw:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:draw];
    
    UIButton *save = [UIButton buttonWithType:UIButtonTypeCustom];
    [save setTitle:@"save" forState:UIControlStateNormal];
    save.frame = CGRectMake(self.view.frame.origin.x + 300, self.view.frame.origin.y + self.view.frame.size.height / 2 + thin.frame.size.height + normal.frame.size.height, 0, 0);
    [save sizeToFit];
    [save setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [save addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:save];
    
    UIButton *simpleColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [simpleColor setTitle:@"simple colors" forState:UIControlStateNormal];
    simpleColor.frame = CGRectMake(self.view.frame.origin.x + 10, self.view.frame.origin.y + self.view.frame.size.height / 2 + thin.frame.size.height + normal.frame.size.height + 50, 0, 0);
    [simpleColor sizeToFit];
    [simpleColor setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [simpleColor addTarget:self action:@selector(simpleColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:simpleColor];
    
    UIButton *myColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [myColor setTitle:@"my colors" forState:UIControlStateNormal];
    myColor.frame = CGRectMake(self.view.frame.origin.x + 10, self.view.frame.origin.y + self.view.frame.size.height / 2 + thin.frame.size.height + normal.frame.size.height + 100, 0, 0);
    [myColor sizeToFit];
    [myColor setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [myColor addTarget:self action:@selector(myColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myColor];
    
    UIButton *createColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [createColor setTitle:@"create colors" forState:UIControlStateNormal];
    createColor.frame = CGRectMake(self.view.frame.origin.x + 10, self.view.frame.origin.y + self.view.frame.size.height / 2 + thin.frame.size.height + normal.frame.size.height + 150, 0, 0);
    [createColor sizeToFit];
    [createColor setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //[createColor addTarget:self action:@selector(createColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createColor];
    
    UIButton *currentColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [currentColor setTitle:@"current color" forState:UIControlStateNormal];
    currentColor.frame = CGRectMake(self.view.frame.origin.x + self.view.frame.size.width - 150, self.view.frame.origin.y + self.view.frame.size.height / 2, 0, 0);
    [currentColor sizeToFit];
    UIColor *cc = [[UIColor alloc] initWithRed:red green:green blue:blue alpha:1.0];
    [currentColor setBackgroundColor:cc];
    [self.view addSubview:currentColor];
    self.currentC = currentColor;
    
    
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