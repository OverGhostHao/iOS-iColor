//
//  CollectionViewCell.h
//  CollectionViewTest
//
//  Created by YuhanHao on 15/11/28.
//  Copyright (c) 2015年 YuhanHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorItem.h"

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

-(void) setCellColor: (ColorItem*)color;

@end
