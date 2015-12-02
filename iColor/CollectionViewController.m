//
//  CollectionViewController.m
//  CollectionViewTest
//
//  Created by YuhanHao on 15/11/28.
//  Copyright (c) 2015年 YuhanHao. All rights reserved.
//

#import "CollectionViewController.h"
#import "ColorItem.h"
#import "SWRevealViewController.h"


#import "CollectionViewCell.h"
#import "detailView.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

NSMutableArray *myColors;
NSArray *colors;

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.title = @"My Colors";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName, nil]];
    
    self.view.backgroundColor = [UIColor colorWithRed:107/255.0 green:185/255.0 blue:240/255.0 alpha:1];

    GlobalVars *globals = [GlobalVars sharedInstance];
    myColors = globals.savedColors;
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return myColors.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    ColorItem *tempC = myColors[indexPath.row];
    cell.textLabel.text = tempC.hexString;
    [cell setCellColor:tempC];
    
    ColorItem *textColor = [[ColorItem alloc]init];
    if (tempC.rValue + tempC.gValue + tempC.bValue > 200) {
        [textColor setRGB:tempC.rValue/2.0 gValue:tempC.gValue/2.0 bValue:tempC.bValue/2.0];
    }else {
        [textColor setRGB:255.0-tempC.rValue gValue:255.0-tempC.gValue bValue:255.0-tempC.bValue];
    }
    cell.textLabel.textColor = textColor.myUIColor;

    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.frame.size.width - 30) / 3;
    CGFloat height = (self.view.frame.size.width - 30) / 3;
    return CGSizeMake(width, height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ColorItem *tc = myColors[indexPath.row];
    
    //create a subview detailView that shows all detail of that view.
    CGFloat subviewWidth = self.view.frame.size.width - 100;
    CGFloat subviewHeight = self.view.frame.size.height - 315;
    CGFloat startX = 50;
    CGFloat startY = 120;
    
    detailView *tempView = [[detailView alloc]initWithFrame:CGRectMake(startX, startY, subviewWidth, subviewHeight)];
    [tempView setContent:tc];
    
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


@end
