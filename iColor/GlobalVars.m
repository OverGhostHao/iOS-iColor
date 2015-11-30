//
//  GlobalVars.m
//  iColor
//
//  Created by YuhanHao on 15/11/30.
//  Copyright (c) 2015年 Skejul. All rights reserved.
//

#import "GlobalVars.h"

@implementation GlobalVars

@synthesize savedColors = savedColors_;
@synthesize savedImages = savedImages_;

+ (GlobalVars *)sharedInstance {
    static dispatch_once_t onceToken;
    static GlobalVars *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[GlobalVars alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        savedColors_ = [NSMutableArray array];
        savedImages_ = [[NSMutableArray alloc] init];
        // Note these aren't allocated as [[NSString alloc] init] doesn't provide a useful object
        //savedColors_ = nil;
        //savedImages_ = nil;
    }
    return self;
}




@end
