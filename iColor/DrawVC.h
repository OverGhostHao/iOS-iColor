

#import <UIKit/UIKit.h>
#import "SimpleColors.h"
#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "SimpleSavedColorVC.h"

@interface DrawVC : UIViewController {
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
-(void)changeColor:(NSString *)s;

@end