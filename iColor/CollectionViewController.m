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

NSArray *myColors;

NSArray *colors;

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
    
    self.view.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    ColorItem *color1 = [[ColorItem alloc]init];
    ColorItem *color2 = [[ColorItem alloc]init];
    ColorItem *color3 = [[ColorItem alloc]init];
    ColorItem *color4 = [[ColorItem alloc]init];
    ColorItem *color5 = [[ColorItem alloc]init];

    [color1 setRGB:99 gValue:66 bValue:33];
    [color2 setRGB:80 gValue:0 bValue:80];
    [color3 setRGB:255 gValue:80 bValue:0];
    [color4 setRGB:255 gValue:00 bValue:255];
    [color5 setRGB:0 gValue:255 bValue:255];

    colors = [[NSArray alloc] initWithObjects:color1, color2, color3, color4, color5, nil];
    // Do any additional setup after loading the view.
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:colors forKey:@"simpleColors"];
//    [defaults synchronize];
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:colors];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:@"colors"];
    [defaults synchronize];

    myColors = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];

    
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
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    ColorItem *tempC = myColors[indexPath.row];
    cell.textLabel.text = tempC.hexString;
    
    [cell setCellColor:tempC];
    
    //save to userDefaults.
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
    NSLog(@"clicked on %li", (long)indexPath.row);
}
 */

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.frame.size.width - 30) / 3;
    CGFloat height = (self.view.frame.size.width - 30) / 3;
    
    return CGSizeMake(width, height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"clicked here at %li", (long)indexPath.row);

    ColorItem *tc = myColors[indexPath.row];
    
    //create a subview detailView that shows all detail of that view.
    CGFloat subviewWidth = self.view.frame.size.width - 100;
    CGFloat subviewHeight = self.view.frame.size.height - 315;
    CGFloat startX = 50;
    CGFloat startY = 120;
    
    detailView *tempView = [[detailView alloc]initWithFrame:CGRectMake(startX, startY, subviewWidth, subviewHeight)];
    [tempView setContent:tc];
    
    [self.view addSubview:tempView];
    
}







@end
