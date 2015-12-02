
#import "GenerateVC.h"
#import "SWRevealViewController.h"

#import "ColorItem.h"

@interface GenerateVC () <updateColorDelegate>

@end

@implementation GenerateVC

@synthesize selectedIndex;

NSMutableArray *currentColors;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //navigation bar setting.
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sidebarButton setTarget:self.revealViewController];
        [self.sidebarButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.title = @"Generate Color";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0], NSForegroundColorAttributeName, [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName, nil]];
    
    CGFloat x = self.view.frame.origin.x;
    CGFloat y = self.view.frame.origin.y + self.navigationController.navigationBar.layer.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height/6 * 5;
    
    //create table view
    self.generateColorTableView = [[UITableView alloc]initWithFrame:CGRectMake(x,y,width,height) style:UITableViewStyleGrouped];
    [self.generateColorTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.generateColorTableView.dataSource = self;
    self.generateColorTableView.delegate = self;
    [self.generateColorTableView setScrollEnabled:false];
    
    //hack way to delete the white space under the navigation bar.
    self.generateColorTableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    [self.view addSubview: self.generateColorTableView];
    
    //magic button
    CGFloat buttonY = self.generateColorTableView.frame.origin.y + height;
    CGFloat buttonHeight = self.view.frame.size.height - buttonY;
    self.magicButton = [[UIButton alloc]initWithFrame:CGRectMake(x, buttonY, width, buttonHeight)];
    self.magicButton.backgroundColor = [UIColor colorWithRed:155/255.0 green:89/255.0 blue:182/255.0 alpha:1];
    [self.magicButton setTitle:@"MAGIC" forState:UIControlStateNormal];
    self.magicButton.titleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:20];
    [self.magicButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:0.447 alpha:1.0] forState:UIControlStateNormal];
    [self.magicButton addTarget:self action:@selector(magicButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.magicButton.showsTouchWhenHighlighted = YES;

    [self.view addSubview:self.magicButton];
    
    //init random colors;
    currentColors = [[NSMutableArray alloc]init];
    for (int i = 0; i < 5; i++) {
        ColorItem *newC = [[ColorItem alloc]init];
        newC = [self generateRandomColor];
        [currentColors addObject:newC];
    }
    
}

- (void)magicButtonTapped:(id)sender {
    for (int i = 0; i < 5; i++) {
        ColorItem *newC = [[ColorItem alloc]init];
        newC = [self generateRandomColor];
        currentColors[i] = newC;
    }
    UITableViewCell *tempCell = [[UITableViewCell alloc]init];
    tempCell = [self.generateColorTableView cellForRowAtIndexPath:selectedIndex];
    ColorCell *preSelectedCell = (ColorCell *)tempCell;
    [preSelectedCell collapseCell];
    selectedIndex = nil;
    [self.generateColorTableView reloadData];
}

-(ColorItem *) generateRandomColor {
    NSInteger red = arc4random_uniform(256);
    NSInteger green = arc4random_uniform(256);
    NSInteger blue = arc4random_uniform(256);
    ColorItem *newColor = [[ColorItem alloc]init];
    [newColor setRGB:red gValue:green bValue:blue];
    return newColor;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ColorItem *color = currentColors[indexPath.row];
    
    //customized cell
    static NSString *cellID = @"cellID";
    ColorCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil){
        cell = [[ColorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID color:color];
    }
    
    //ColorItem *color = currentColors[indexPath.row];
    cell.rValue = color.rValue;
    cell.gValue = color.gValue;
    cell.bValue = color.bValue;
    cell.mycolor = color;
    
    cell.delegate = self;
    cell.tag = indexPath.row;
    cell.backgroundColor = color.myUIColor;
    cell.textLabel.text = color.hexString;
    ColorItem *textColor = [[ColorItem alloc]init];
    if (color.rValue + color.gValue + color.bValue > 200) {
        [textColor setRGB:color.rValue/2.0 gValue:color.gValue/2.0 bValue:color.bValue/2.0];
    }else {
        [textColor setRGB:255.0-color.rValue gValue:255.0-color.gValue bValue:255.0-color.bValue];
    }
    cell.textLabel.textColor = textColor.myUIColor;
    [cell.textLabel setFont:[UIFont fontWithName:@"American Typewriter" size:20]];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *path = [NSArray arrayWithObject:indexPath];
    if (selectedIndex == nil){
        selectedIndex = indexPath;
        //expand cell
        [tableView reloadRowsAtIndexPaths:path withRowAnimation:UITableViewRowAnimationNone];
        ColorCell *curerentSelectedCell = (ColorCell *)[self.generateColorTableView cellForRowAtIndexPath:indexPath];
        [curerentSelectedCell expandCell];
    }
    else{
        
        //select other row
        if (indexPath.row != selectedIndex.row){
            NSIndexPath *preSelected = selectedIndex;
            selectedIndex = indexPath;
            
            //collapse current selected cell
            NSArray *preSelectedPath = [NSArray arrayWithObject:preSelected];
            [tableView reloadRowsAtIndexPaths:preSelectedPath withRowAnimation:UITableViewRowAnimationNone];
            ColorCell *preSelectedCell = (ColorCell *)[self.generateColorTableView cellForRowAtIndexPath:preSelected];
            [preSelectedCell collapseCell];
            
            //expand new selected cell
            [tableView reloadRowsAtIndexPaths:path withRowAnimation:UITableViewRowAnimationNone];
            ColorCell *curerentSelectedCell = (ColorCell *)[self.generateColorTableView cellForRowAtIndexPath:indexPath];
            [curerentSelectedCell expandCell];
        }
        //deselectd
        else{
            //collapse current selected cell
            selectedIndex = nil;
            [tableView reloadRowsAtIndexPaths:path withRowAnimation:UITableViewRowAnimationNone];
            ColorCell *preSelectedCell = (ColorCell *)[self.generateColorTableView cellForRowAtIndexPath:indexPath];
            [preSelectedCell collapseCell];
        }
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (selectedIndex == nil){
        return self.view.frame.size.height/6;
    }
    else{
        if (indexPath == selectedIndex){
            return self.view.frame.size.height*5/12;
            
        }
        else{
            return self.view.frame.size.height*5/48;
        }
    }
}

-(void)updateColor:(NSInteger)indexRow newColor:(ColorItem*)newColor{
    currentColors[indexRow] = newColor;
    ColorCell *preSelectedCell = (ColorCell *)[self.generateColorTableView cellForRowAtIndexPath:selectedIndex];
    [preSelectedCell collapseCell];
    selectedIndex = nil;
    [self.generateColorTableView reloadData];
}

@end