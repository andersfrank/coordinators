//
//  SessionManager.m
//  Signup
//
//  Created by Anders Frank on 2016-09-16.
//  Copyright © 2016 Anders Frank. All rights reserved.
//

#import "SessionManager.h"

@implementation SessionManager

+ (instancetype)sharedManager {
    static SessionManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

@end
