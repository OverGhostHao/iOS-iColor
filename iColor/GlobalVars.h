//
//  GlobalVars.h
//  iColor
//
//  Created by YuhanHao on 15/11/30.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVars : NSObject {
    NSMutableArray *savedColors_;
    NSMutableArray *savedImages_;
}

+ (GlobalVars *)sharedInstance;

@property(strong, nonatomic, readwrite) NSMutableArray *savedColors;
@property(strong, nonatomic, readwrite) NSMutableArray *savedImages;

@end
