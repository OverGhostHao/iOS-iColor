//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "DrawVC.h"

@interface SimpleColors: UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (nonatomic, strong) NSArray *simpleColors;
@property (nonatomic, strong) NSArray *simpleColorsHex;
@property (nonatomic, strong) UITableView *tableView;
@property UIViewController *draw;

@end